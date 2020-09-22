Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2BC2273727
	for <lists+linux-remoteproc@lfdr.de>; Tue, 22 Sep 2020 02:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729156AbgIVAKW (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 21 Sep 2020 20:10:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729125AbgIVAKN (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 21 Sep 2020 20:10:13 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D767C0613CF
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2020 17:10:13 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id k14so10434707pgi.9
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2020 17:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kjxi5jPY+5fiGib9aemaW9NnwRUiNwpEBOAwlpbjCi0=;
        b=EjV9H6eR89HJ++cASGIFensX72XSXg+IFP9M3mKjHvsMy3f146k9UUilXnSUfmEiVc
         3B325WaWi9ZUSOzRSmL6PsQA0em7gIGb3Fja199BBBNTDoR796qUsfHPwZh1dpHoNwi0
         jzxtxb8+6+kDkMhJzRys+ogIOrlyJXM2gbg2kCfWmY90L7kS7zxaSpTNdRBHv11cK/7V
         9BksIdUFNr6OCaATgwFpSxGMHGSX1DLdWEzT4aliit/3g7qfid6p+xAnKudJJQs9nuCk
         EHO8IsyPDrKZ/J1cZrzTPqBHChS6dDjkPH7iFWmr2xPcVA4LfpVKXtc0qjXK7Dc1uuOC
         3Z3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kjxi5jPY+5fiGib9aemaW9NnwRUiNwpEBOAwlpbjCi0=;
        b=Ay+g7rsIk1N+EEB+ttIokq259mktVV7meGyMTbpm5iIe3gv9SYyRaU5yCsDKvIyxT3
         953mL89v6GgUaDyhSgJUDi/0RRGkJvFNyTfcxFx9oOZ8lo0eUPtRK+i7/Xmi5DbyFbDL
         Tw85F9YlM2O+3u+ScjABYD3f6JcZ3dcsWOfOiE9bKEjwaPeOlOuAfm1ufL/bXuWwFCaJ
         fg+7u78UFSlTUcso7FA2Hrkqd/pAgZnCRUqM/e5HorTx5uepdpINsQjWuLGPlkMG75RY
         ZK06LSmIxb0aFrcCs+ovu9LCbEZkCFOq5L3L+Bf/4teCcmHkA9XrrWQ59GYPJ+zhNkyl
         rFKA==
X-Gm-Message-State: AOAM530Z7odDV02pHILKnvAdnKgpGOlNNOf9+wIMuDJhp8+wwH28yrJc
        mWxADR6505AYSPda8kKTbdQALg==
X-Google-Smtp-Source: ABdhPJxpCINuRSuKV4NEjLVkGeyuI4+z9LCyALw01vOZ954g/7R2EFYevIRMs05UPRRJxSJNJa/Orw==
X-Received: by 2002:a63:384f:: with SMTP id h15mr1572345pgn.144.1600733413027;
        Mon, 21 Sep 2020 17:10:13 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id c9sm12807953pfn.78.2020.09.21.17.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 17:10:12 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        guennadi.liakhovetski@linux.intel.com
Cc:     loic.pallardy@st.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 09/10] rpmsg: virtio: Make endianness conversion virtIO specific
Date:   Mon, 21 Sep 2020 18:09:59 -0600
Message-Id: <20200922001000.899956-10-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200922001000.899956-1-mathieu.poirier@linaro.org>
References: <20200922001000.899956-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Introduce rpmsg operations to make byte conversion specific to the
virtIO transport layer, therefore avoiding the protocol code from
being aware of the virtIO transport specification.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 36 ++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 1c0be0ee790c..15cc383a85cc 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -157,6 +157,38 @@ static struct rpmsg_endpoint *__rpmsg_create_ept(struct virtproc_info *vrp,
 	return NULL;
 }
 
+static u16 virtio_rpmsg_transport16_to_cpu(struct rpmsg_device *rpdev, u16 val)
+{
+	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
+	struct virtproc_info *vrp = vch->vrp;
+
+	return virtio16_to_cpu(vrp->vdev, val);
+}
+
+static u16 virtio_rpmsg_cpu_to_transport16(struct rpmsg_device *rpdev, u16 val)
+{
+	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
+	struct virtproc_info *vrp = vch->vrp;
+
+	return cpu_to_virtio16(vrp->vdev, val);
+}
+
+static u32 virtio_rpmsg_transport32_to_cpu(struct rpmsg_device *rpdev, u32 val)
+{
+	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
+	struct virtproc_info *vrp = vch->vrp;
+
+	return virtio32_to_cpu(vrp->vdev, val);
+}
+
+static u32 virtio_rpmsg_cpu_to_transport32(struct rpmsg_device *rpdev, u32 val)
+{
+	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
+	struct virtproc_info *vrp = vch->vrp;
+
+	return cpu_to_virtio32(vrp->vdev, val);
+}
+
 static struct rpmsg_device *
 virtio_rpmsg_create_channel(struct rpmsg_device *rpdev,
 			    struct rpmsg_channel_info *chinfo)
@@ -268,6 +300,10 @@ static int virtio_rpmsg_announce_destroy(struct rpmsg_device *rpdev)
 }
 
 static const struct rpmsg_device_ops virtio_rpmsg_ops = {
+	.transport16_to_cpu = virtio_rpmsg_transport16_to_cpu,
+	.cpu_to_transport16 = virtio_rpmsg_cpu_to_transport16,
+	.transport32_to_cpu = virtio_rpmsg_transport32_to_cpu,
+	.cpu_to_transport32 = virtio_rpmsg_cpu_to_transport32,
 	.create_channel = virtio_rpmsg_create_channel,
 	.release_channel = virtio_rpmsg_release_channel,
 	.create_ept = virtio_rpmsg_create_ept,
-- 
2.25.1

