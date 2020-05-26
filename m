Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4546E1C494A
	for <lists+linux-remoteproc@lfdr.de>; Mon,  4 May 2020 23:58:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728040AbgEDV6g (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 4 May 2020 17:58:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727809AbgEDV6f (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 4 May 2020 17:58:35 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74C42C061A0F
        for <linux-remoteproc@vger.kernel.org>; Mon,  4 May 2020 14:58:34 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id t9so90355pjw.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 04 May 2020 14:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FZIkYuBAw0Vt07t90y7SmRompH2guq1hUwxisleO2Sg=;
        b=JAHqLHf44k7Azt/vctQh14vA8d8qWKs+Q7+eY4ITBPmLi2zzRctJzqH4RhTp+L7ZFT
         Dv2fNBLPXMZZNELH2qiRhGnS7s4dl++bGWtYmcHDxzupygBOrrGlM6h5JD1pd0Z0/9zi
         rwJWumSRVRRyD9YkeYfrXLkzpj2xOogkNtOvPY+/h0O2XKE6Werc4Lv+BCpQNjiesu0t
         47AOQJR3NcuV3k3f0U8/N8eFKsSoDjpEqg9k/UI14n+P6LkO38waw5ISyug2hrDjeImP
         xAXAyHmW3glwn5OaDiZLBWT4ahxbl70KCCHOLX92N2A0pZ0mYOgyt0s6LD23ifr/gNTP
         RDvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FZIkYuBAw0Vt07t90y7SmRompH2guq1hUwxisleO2Sg=;
        b=hf6DBPg3qA6gENzvfbLITl5z6n8BuF+JTsZVPPHhA2bu+lhzSULrfO8fVuZn2sEx2N
         ji9qL4a1zufLw6+i12+gdvlKxJNPRnosQYjLf+1rPZ7g6LJLAku5RV1dVTRtcKPk5VJc
         Q6F8jkXZjq7URCssBDSHAEJoNw2XYiaY6KjyDXlMu57YZwsECaXWaN3MQoHmKTz4WGuc
         Jzn32W1gvrf6CQNvKU1HsVgLt7VgFm4p+oh2oKEVag6+gxnyDCZudaAxIomPcHuuQmKh
         pT4EiZcw6V3f6NK+fIBVKG59dMZs6GP+a0rfLZbbwFdNyC9LZ4rt2NTG9hi2KgEPhYgn
         gyZA==
X-Gm-Message-State: AGi0PuYxfkT8bGFyV9et7tEDyMETZld4kpDBZOjua2+FHds66Wve3COo
        LkUASohLWdhogMlUn7rld/k/Ew==
X-Google-Smtp-Source: APiQypL84x+AYfOngfIXNvyGk9jjJh/FB1xN2WSc0F2Yq63lPv9Ue99R27KuRcaBedaNKaFqwyPPqA==
X-Received: by 2002:a17:902:59cc:: with SMTP id d12mr150100plj.237.1588629513927;
        Mon, 04 May 2020 14:58:33 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id g10sm60185pfk.103.2020.05.04.14.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 14:58:33 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] rpmsg: core: Add support to retrieve name extension
Date:   Mon,  4 May 2020 15:58:30 -0600
Message-Id: <20200504215830.31394-3-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200504215830.31394-1-mathieu.poirier@linaro.org>
References: <20200504215830.31394-1-mathieu.poirier@linaro.org>
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

Suggested-by: Suman Anna <s-anna@ti.com>;
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/rpmsg/rpmsg_core.c | 92 ++++++++++++++++++++++++++++++++++++++
 include/linux/rpmsg.h      | 13 ++++++
 2 files changed, 105 insertions(+)

diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index 5e01e8dede6b..dae87c0cb73d 100644
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
index 9fe156d1c018..9537b95ad30a 100644
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
@@ -242,6 +245,16 @@ static inline __poll_t rpmsg_poll(struct rpmsg_endpoint *ept,
 	return 0;
 }
 
+static inline
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

