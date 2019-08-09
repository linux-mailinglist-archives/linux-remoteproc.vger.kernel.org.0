Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DF2687FEA
	for <lists+linux-remoteproc@lfdr.de>; Fri,  9 Aug 2019 18:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437090AbfHIQ1X (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 9 Aug 2019 12:27:23 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:40626 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbfHIQ1X (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 9 Aug 2019 12:27:23 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x79GRG2b045349;
        Fri, 9 Aug 2019 11:27:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1565368036;
        bh=Ud/YD36dCD+bN44/VnWcQ46y2onOorVRIeTBCHH7/UA=;
        h=From:To:CC:Subject:Date;
        b=FHVWF8swu/6sCXNH5dqU8QcEuZOVvEu5p4QG/HT77xaasUtbSAnXaluZayXdYFcoi
         xvqbzi27NcWiYw/aIzPOzwoaBDUQ7g21UdEDEcXXBjLyIEejcaktwRkhhhfRl3ngRx
         PdUt3bzLLoIKy37OMLAuff7yqsYGZeAnnyK46Pek=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x79GRGFN049499
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 9 Aug 2019 11:27:16 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 9 Aug
 2019 11:27:15 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 9 Aug 2019 11:27:15 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x79GRFkf096384;
        Fri, 9 Aug 2019 11:27:15 -0500
Received: from localhost (irmo.dhcp.ti.com [128.247.58.153])
        by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id x79GRFZ10536;
        Fri, 9 Aug 2019 11:27:15 -0500 (CDT)
From:   Suman Anna <s-anna@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 0/2] Minor cleanups/improvements in rpmsg-client-sample
Date:   Fri, 9 Aug 2019 11:27:08 -0500
Message-ID: <20190809162710.823-1-s-anna@ti.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Bjorn,

The following are minor cleanup/improvement patches to the rpmsg_client_sample.
The first patch is new, and the second patch is a repost. Appreciate it if you
can pick these up for 5.4 merge window.

regards
Suman

Suman Anna (2):
  samples/rpmsg: Replace print_hex_dump() with print_hex_dump_debug()
  samples/rpmsg: Introduce a module parameter for message count

 samples/rpmsg/rpmsg_client_sample.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

-- 
2.22.0

