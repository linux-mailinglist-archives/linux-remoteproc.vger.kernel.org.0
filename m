Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAEBD2AD4A8
	for <lists+linux-remoteproc@lfdr.de>; Tue, 10 Nov 2020 12:21:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726219AbgKJLU5 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 10 Nov 2020 06:20:57 -0500
Received: from muru.com ([72.249.23.125]:47682 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730296AbgKJLU4 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 10 Nov 2020 06:20:56 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 83FA981A8;
        Tue, 10 Nov 2020 11:20:59 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH 2/9] ARM: OMAP2+: Probe PRCM first to probe l4_wkup with simple-pm-bus
Date:   Tue, 10 Nov 2020 13:20:35 +0200
Message-Id: <20201110112042.65489-3-tony@atomide.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201110112042.65489-1-tony@atomide.com>
References: <20201110112042.65489-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

In preparation for probing the interconnects with simple-pm-bus to
make use of genpd, we need to probe the always-on PRCM first for the
clocks needed by l4_wkup instance.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/pdata-quirks.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/mach-omap2/pdata-quirks.c b/arch/arm/mach-omap2/pdata-quirks.c
--- a/arch/arm/mach-omap2/pdata-quirks.c
+++ b/arch/arm/mach-omap2/pdata-quirks.c
@@ -580,6 +580,8 @@ static void pdata_quirks_check(struct pdata_init *quirks)
 
 void __init pdata_quirks_init(const struct of_device_id *omap_dt_match_table)
 {
+	struct device_node *np;
+
 	/*
 	 * We still need this for omap2420 and omap3 PM to work, others are
 	 * using drivers/misc/sram.c already.
@@ -591,6 +593,15 @@ void __init pdata_quirks_init(const struct of_device_id *omap_dt_match_table)
 	if (of_machine_is_compatible("ti,omap3"))
 		omap3_mcbsp_init();
 	pdata_quirks_check(auxdata_quirks);
+
+	/* Populate always-on PRCM in l4_wkup to probe l4_wkup */
+	np = of_find_node_by_name(NULL, "prcm");
+	if (!np)
+		np = of_find_node_by_name(NULL, "prm");
+	if (np)
+		of_platform_populate(np, omap_dt_match_table,
+				     omap_auxdata_lookup, NULL);
+
 	of_platform_populate(NULL, omap_dt_match_table,
 			     omap_auxdata_lookup, NULL);
 	pdata_quirks_check(pdata_quirks);
-- 
2.29.2
