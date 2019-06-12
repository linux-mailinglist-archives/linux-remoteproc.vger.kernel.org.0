Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 385ED421AB
	for <lists+linux-remoteproc@lfdr.de>; Wed, 12 Jun 2019 11:55:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437899AbfFLJz2 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 12 Jun 2019 05:55:28 -0400
Received: from zimbra2.kalray.eu ([92.103.151.219]:38338 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437898AbfFLJz2 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 12 Jun 2019 05:55:28 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 47D6027FBC29;
        Wed, 12 Jun 2019 11:55:26 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id MD5AgQDHufF4; Wed, 12 Jun 2019 11:55:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 08A3927FBC1F;
        Wed, 12 Jun 2019 11:55:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 08A3927FBC1F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1560333326;
        bh=Xdas7U+/35dIUC2bbOxt1kt+SfAUvBNoiNo+nMRpq+s=;
        h=From:To:Date:Message-Id;
        b=NS2AunL/nFw+WezH5UE0jdjSTh6j1IqDQ0mnVeYyOlMOAdnEWqQ70/EedjPZoHGe8
         3/+/X1X6bcoI2yTxlF/u43fi8P72f6T94rju9PMHi7NJB4s2BIg6fq50WBwsszR+DL
         hk2/8JvodVtWhBZPxtNIQKKEJYNP0tbGIBpyXyLc=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 37PL_mHoZxo4; Wed, 12 Jun 2019 11:55:25 +0200 (CEST)
Received: from triton.lin.mbt.kalray.eu (unknown [192.168.37.25])
        by zimbra2.kalray.eu (Postfix) with ESMTPSA id EBFF027FBC0C;
        Wed, 12 Jun 2019 11:55:25 +0200 (CEST)
From:   Clement Leger <cleger@kalray.eu>
To:     "Ohad Ben-Cohen" <ohad@wizery.com>,
        "Bjorn Andersson" <bjorn.andersson@linaro.org>,
        "linux-remoteproc" <linux-remoteproc@vger.kernel.org>
Cc:     Clement Leger <cleger@kalray.eu>
Subject: [PATCH] remoteproc: recopy parent dma_pfn_offset for vdev
Date:   Wed, 12 Jun 2019 11:55:21 +0200
Message-Id: <20190612095521.4703-1-cleger@kalray.eu>
X-Mailer: git-send-email 2.15.0.276.g89ea799
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

When preparing the subdevice for the vdev, also copy dma_pfn_offset
since this is used for sub device dma allocations. Without that, there
is incoherency between the parent dma settings and the childs one,
potentially leading to dma_alloc_coherent failure (due to phys_to_dma
using dma_pfn_offset for translation).
---
 drivers/remoteproc/remoteproc_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 263e9c9614a8..3b56ca043231 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -520,6 +520,7 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
 	/* Initialise vdev subdevice */
 	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
 	rvdev->dev.parent = rproc->dev.parent;
+	rvdev->dev.dma_pfn_offset = rproc->dev.parent->dma_pfn_offset;
 	rvdev->dev.release = rproc_rvdev_release;
 	dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev->dev.parent), name);
 	dev_set_drvdata(&rvdev->dev, rvdev);
-- 
2.15.0.276.g89ea799

