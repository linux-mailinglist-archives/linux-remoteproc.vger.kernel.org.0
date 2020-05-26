Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C4AA1C1EE5
	for <lists+linux-remoteproc@lfdr.de>; Fri,  1 May 2020 22:53:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726272AbgEAUtz (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 1 May 2020 16:49:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726762AbgEAUty (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 1 May 2020 16:49:54 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87708C061A0C
        for <linux-remoteproc@vger.kernel.org>; Fri,  1 May 2020 13:49:54 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id t7so4044994plr.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 01 May 2020 13:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ed2JN9Qrs/BgbUyRA8SQWsPnAw1/64uJrHHZOYU0VuI=;
        b=LRXc2J5dNQ3uETTwR3QtkKi8YwyPxqcCWiJWMZ0Zx1AMKYBQPM9FoYBozFdm6xi6Yp
         UqAKlj4z7GDnp5s0UfHvitly9pen80OikbwqkkA/HvNicfPojTHZq/oV9AGdpWjUFKmr
         hxvICPMaMdb3v1jLXZNevBMvu6HmSRBQ5WE8AL2ecLXpY26OvirTqOaD5Ko6I7kKRIRH
         hia7ah2UB1/GCSILl0AnkuZfMMEuXaHQx63qkoW7TheedcokEn0lo9vU5AYLCi2/SC26
         UmTn4IPwd2A92smMEmyIm79ch7bTxG99pqbO5NIsCmWHuYj7iKpcBpxoT0WKHct96nrU
         AjCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ed2JN9Qrs/BgbUyRA8SQWsPnAw1/64uJrHHZOYU0VuI=;
        b=WEDAkSRcTzZceaB1f1fAAMrWnGuKFYKRlrdLRnedmASJ+9O6uQUvC/AY+gZWyw5aJU
         vM4D5Z4SQ/OFIb1sY95FBEYPRZYejmiNvR9c4vWGerJQ3urBVxK91uXAUOvHPwDdXKYx
         /NcX0ol4l8PysQjNMDEfkaO+HiHJmrJyXoUYKN6dAk9F7YCnCRNgHEsQTXxoXv46eAg5
         i3VpUfCQEfHJljznpMDwPsDXXGs9hxLK3LkXD/mHKRgRhj9AtLdB2ZaVtwSMciUJX/F7
         ILir0aLFgwVJezePACINUd4Jb9mZBORQEhRO6QYwEVDoj/97PBR2bewY/TbLzAl64nIZ
         Emkg==
X-Gm-Message-State: AGi0Pubnp4ARsrpeC+mHgybvzAUExV5mQod4re3EgJuJSXPqJA/QPiGo
        pICcT0tfxalw516GJ4AMpM26AA==
X-Google-Smtp-Source: APiQypI1YN17UKMZ/YjQ+eiCcWhVTFiRDKM5wWBtUbYVBtYh8FR9LKUR+etDm/rl7sS+AngwbjDWjw==
X-Received: by 2002:a17:90b:3444:: with SMTP id lj4mr1659462pjb.37.1588366193975;
        Fri, 01 May 2020 13:49:53 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id 23sm497072pjb.11.2020.05.01.13.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 13:49:53 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] rpmsg: core: Add support to retrieve name extension
Date:   Fri,  1 May 2020 14:49:50 -0600
Message-Id: <20200501204950.18629-3-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200501204950.18629-1-mathieu.poirier@linaro.org>
References: <20200501204950.18629-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

After adding support for rpmsg device name extension, this patch
provides a function that returns the extension portion of an rpmsg
device name.  That way users of the name extension functionality don't
have to write the same boiler plate code to extract the information.

Suggested-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/rpmsg/rpmsg_core.c | 92 ++++++++++++++++++++++++++++++++++++++
 include/linux/rpmsg.h      | 12 +++++
 2 files changed, 104 insertions(+)

diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index bfd25978fa35..86b6d26907ad 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -439,6 +439,98 @@ static int rpmsg_dev_match(struct device *dev, struct device_driver *drv)
 	return of_driver_match_device(dev, drv);
 }
 
+/**
+ * rpmsg_device_get_name_extension() - get the name extension of a rpmsg device
+ * @rpdev: the rpmsg device to work with
+ * @skip: how many characters in the extension should be skipped over
+ *
+ * With function rpmsg_id_match() allowing for extension of the base driver name
+ * in order to differentiate services, this function returns the extension part
+ * of an rpmsg device name.  As such and with the following rpmsg driver device
+ * id table and rpmsg device names:
+ *
+ * static struct rpmsg_device_id rpmsg_driver_sample_id_table[] = {
+ *      { .name = "rpmsg-client-sample" },
+ *      { },
+ * }
+ *
+ * rpdev1->id.name == "rpmsg-client-sample";
+ * rpdev2->id.name == "rpmsg-client-sample_instance0";
+ *
+ * Calling rpmsg_device_get_name_extension() will yields the following:
+ *
+ * rpmsg_device_get_name_extension(rpdev1, 0) == NULL;
+ * rpmsg_device_get_name_extension(rpdev2, 0) == "_instance0";
+ * rpmsg_device_get_name_extension(rpdev2, 1) == "instance0";
+ *
+ *
+ * Note: The name extension should be free'd using kfree_const().
+ *
+ * Return: the name extension if found, NULL if not found and an error
+ * code otherwise.
+ */
+const char *rpmsg_device_get_name_extension(struct rpmsg_device *rpdev,
+					    unsigned int skip)
+{
+	const char *drv_name, *dev_name, *extension;
+	const struct rpmsg_device_id *ids;
+	struct device *dev = &rpdev->dev;
+	struct rpmsg_driver *rpdrv;
+	bool match = false;
+	unsigned int i;
+
+	if (!dev->driver)
+		return ERR_PTR(-EINVAL);
+
+	rpdrv = to_rpmsg_driver(dev->driver);
+
+	/*
+	 * No point in going further if the device and the driver don't
+	 * have a name or a table to work with.
+	 */
+	if (!rpdev->id.name[0] || !rpdrv->id_table)
+		return ERR_PTR(-EINVAL);
+
+	ids = rpdrv->id_table;
+	dev_name = rpdev->id.name;
+
+	/*
+	 * See if any name in the driver's table match the beginning
+	 * of the rpmsg device's name.
+	 */
+	for (i = 0; ids[i].name[0]; i++) {
+		drv_name = ids[i].name;
+		if (strncmp(drv_name,
+			    dev_name, strlen(drv_name)) == 0) {
+			match = true;
+			break;
+		}
+	}
+
+	if (!match)
+		return NULL;
+
+	 /* No name extension to return if device and driver are the same */
+	if (strlen(dev_name) == strlen(drv_name))
+		return NULL;
+
+	/*
+	 * Make sure we were not requested to skip past the end
+	 * of the device name.
+	 */
+	if (strlen(drv_name) + skip >= strlen(dev_name))
+		return ERR_PTR(-EINVAL);
+
+	/*
+	 * Move past the base name published by the driver and
+	 * skip any extra characters if needed.
+	 */
+	extension = dev_name + strlen(drv_name) + skip;
+
+	return kstrdup_const(extension, GFP_KERNEL);
+}
+EXPORT_SYMBOL(rpmsg_device_get_name_extension);
+
 static int rpmsg_uevent(struct device *dev, struct kobj_uevent_env *env)
 {
 	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
index 9fe156d1c018..5770c3fb3924 100644
--- a/include/linux/rpmsg.h
+++ b/include/linux/rpmsg.h
@@ -135,6 +135,9 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
 __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
 			poll_table *wait);
 
+const char *rpmsg_device_get_name_extension(struct rpmsg_device *dev,
+					    unsigned int skip);
+
 #else
 
 static inline int register_rpmsg_device(struct rpmsg_device *dev)
@@ -242,6 +245,15 @@ static inline __poll_t rpmsg_poll(struct rpmsg_endpoint *ept,
 	return 0;
 }
 
+const char *rpmsg_device_get_name_extension(struct rpmsg_device *dev,
+					    unsigned int skip)
+{
+	/* This shouldn't be possible */
+	WARN_ON(1);
+
+	return NULL;
+}
+
 #endif /* IS_ENABLED(CONFIG_RPMSG) */
 
 /* use a macro to avoid include chaining to get THIS_MODULE */
-- 
2.20.1

