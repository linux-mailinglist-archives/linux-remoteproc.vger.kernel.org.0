Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B0E01735D0
	for <lists+linux-remoteproc@lfdr.de>; Fri, 28 Feb 2020 12:07:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbgB1LHK (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 28 Feb 2020 06:07:10 -0500
Received: from forward101p.mail.yandex.net ([77.88.28.101]:46378 "EHLO
        forward101p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726778AbgB1LHK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 28 Feb 2020 06:07:10 -0500
Received: from forward100q.mail.yandex.net (forward100q.mail.yandex.net [IPv6:2a02:6b8:c0e:4b:0:640:4012:bb97])
        by forward101p.mail.yandex.net (Yandex) with ESMTP id D97A73281116;
        Fri, 28 Feb 2020 14:07:06 +0300 (MSK)
Received: from mxback9q.mail.yandex.net (mxback9q.mail.yandex.net [IPv6:2a02:6b8:c0e:6b:0:640:b813:52e4])
        by forward100q.mail.yandex.net (Yandex) with ESMTP id D719A7080009;
        Fri, 28 Feb 2020 14:07:06 +0300 (MSK)
Received: from vla1-61ce7aa04735.qloud-c.yandex.net (vla1-61ce7aa04735.qloud-c.yandex.net [2a02:6b8:c0d:3e86:0:640:61ce:7aa0])
        by mxback9q.mail.yandex.net (mxback/Yandex) with ESMTP id hroNpCvPZS-76FGlZsk;
        Fri, 28 Feb 2020 14:07:06 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1582888026;
        bh=6ZttMXpzkKUkjq7swchhjpIOghz2F5MHQ3V90TIxyaQ=;
        h=Subject:To:From:Cc:Date:Message-Id;
        b=SLMoxyyBKbppGva2H1uPKFfEtfRMT9Hvem6U0fMqdOPxpsfVWbcY4PClFQHmO1dBl
         1R5vBbFSPMvP/3XbvwnQXVHqlioZ9j2axyxqPe/i5jqAJMT7cTcBhznj/gATBl8NZM
         EPslYk56AhFKSaKpr6zVt/6sJHtA2ZEjqTbeTkEo=
Authentication-Results: mxback9q.mail.yandex.net; dkim=pass header.i=@maquefel.me
Received: by vla1-61ce7aa04735.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id bXDf96qZCu-75IiPKaY;
        Fri, 28 Feb 2020 14:07:05 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   nikita.shubin@maquefel.me
Cc:     nikita.shubin@maquefel.me, Nikita Shubin <NShubin@topcon.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] remoteproc: error on kick missing
Date:   Fri, 28 Feb 2020 14:08:04 +0300
Message-Id: <20200228110804.25822-1-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Nikita Shubin <NShubin@topcon.com>

.kick method not set in rproc_ops will result in:

8<--- cut here ---
Unable to handle kernel NULL pointer dereference

in rproc_virtio_notify, after firmware loading.

refuse to register an rproc-induced virtio device if no kick method was
defined for rproc.

Signed-off-by: Nikita Shubin <NShubin@topcon.com>
---
 drivers/remoteproc/remoteproc_virtio.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index 8c07cb2ca8ba..31a62a0b470e 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -334,6 +334,13 @@ int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 	struct rproc_mem_entry *mem;
 	int ret;
 
+	if (rproc->ops->kick == NULL) {
+		ret = -EINVAL;
+		dev_err(dev, ".kick method not defined for %s",
+				rproc->name);
+		goto out;
+	}
+
 	/* Try to find dedicated vdev buffer carveout */
 	mem = rproc_find_carveout_by_name(rproc, "vdev%dbuffer", rvdev->index);
 	if (mem) {
-- 
2.24.1

