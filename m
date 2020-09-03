Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C8AD25BF46
	for <lists+linux-remoteproc@lfdr.de>; Thu,  3 Sep 2020 12:44:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728321AbgICKoi (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 3 Sep 2020 06:44:38 -0400
Received: from mo-csw1115.securemx.jp ([210.130.202.157]:60316 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725984AbgICKoh (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 3 Sep 2020 06:44:37 -0400
X-Greylist: delayed 446 seconds by postgrey-1.27 at vger.kernel.org; Thu, 03 Sep 2020 06:44:36 EDT
Received: by mo-csw.securemx.jp (mx-mo-csw1115) id 083AiKb0018512; Thu, 3 Sep 2020 19:44:21 +0900
X-Iguazu-Qid: 2wGr7dZaSIQ3izezc8
X-Iguazu-QSIG: v=2; s=0; t=1599129860; q=2wGr7dZaSIQ3izezc8; m=rClWSIHtHIcYHMenNimffmgBtp0sivHSc26ZxuLMey8=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
        by relay.securemx.jp (mx-mr1111) id 083AiJTb024969;
        Thu, 3 Sep 2020 19:44:19 +0900
Received: from enc02.toshiba.co.jp ([61.202.160.51])
        by imx12.toshiba.co.jp  with ESMTP id 083AiILn020387;
        Thu, 3 Sep 2020 19:44:18 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 083AiIIa030126;
        Thu, 3 Sep 2020 19:44:18 +0900
From:   Punit Agrawal <punit1.agrawal@toshiba.co.jp>
To:     Ben Levinsky <ben.levinsky@xilinx.com>
Cc:     stefanos@xilinx.com, michals@xilinx.com, michael.auchter@ni.com,
        devicetree@vger.kernel.org, emooring@xilinx.com,
        mathieu.poirier@linaro.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, jliang@xilinx.com,
        robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v11 5/5] remoteproc: Add initial zynqmp R5 remoteproc driver
References: <20200902165846.3366-1-ben.levinsky@xilinx.com>
        <20200902165846.3366-6-ben.levinsky@xilinx.com>
Date:   Thu, 03 Sep 2020 19:44:12 +0900
In-Reply-To: <20200902165846.3366-6-ben.levinsky@xilinx.com> (Ben Levinsky's
        message of "Wed, 2 Sep 2020 09:58:46 -0700")
X-TSB-HOP: ON
Message-ID: <87tuwfp2bn.fsf@kokedama.swc.toshiba.co.jp>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Ben Levinsky <ben.levinsky@xilinx.com> writes:

> R5 is included in Xilinx Zynq UltraScale MPSoC so by adding this
> remotproc driver, we can boot the R5 sub-system in different 2
> configurations: split or lock-step.
>
> The Xilinx R5 Remoteproc Driver boots the R5's via calls to the Xilinx
> Platform Management Unit that handles the R5 configuration, memory access
> and R5 lifecycle management. The interface to this manager is done in this
> driver via zynqmp_pm_* function calls.
>
> Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
> Signed-off-by: Wendy Liang <wendy.liang@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> Signed-off-by: Ed Mooring <ed.mooring@xilinx.com>
> Signed-off-by: Jason Wu <j.wu@xilinx.com>

The Signed-off-by chain looks wrong here. As the submitter, your tag
should be last in the chain.

See Documentation/process/submitting-patches.rst for more details.

Thanks,
Punit


[...]

