Return-Path: <linux-remoteproc+bounces-913-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A90988E534
	for <lists+linux-remoteproc@lfdr.de>; Wed, 27 Mar 2024 15:19:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0ED329A5CF
	for <lists+linux-remoteproc@lfdr.de>; Wed, 27 Mar 2024 14:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 227C3149E0D;
	Wed, 27 Mar 2024 12:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SnYTSLYs"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60406149E09
	for <linux-remoteproc@vger.kernel.org>; Wed, 27 Mar 2024 12:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711543456; cv=none; b=pgvaNafrnnNQ+kY0DddtouElka8xLOqee/jpxqRRXGyvDUeTfZuWBGvL/SpyL4/ty1pFPXhEmSh1cqXbppiGa3G7r7UeKjlTG1i0c1MGdU59U+GNoweFBZc4H5frnpsVSPLokxDFKOGcI42NZm2ij9H4SjZSbwG8zkNl2uQ70gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711543456; c=relaxed/simple;
	bh=BF5+L9M6rh/9q/lpIn327dnJkaSg5SfZZk5BFIHRLEw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i81cuZBtbPki+/V7vwb2NUZoWgZI5rsCCy4pbDDvYeaBEmIDoyIay4GBXJVPqI/FDlLQjaC17WMZ27E5Ft4gVr7u8t24J5m4rFesNSSBBbXNGAdfqfD+zPvMAmBeHXHweps3Xmltxj+Oy9GMYL3IMt0rjkgd9KfZpyGEFN6/VQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SnYTSLYs; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-513d3746950so8341053e87.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 27 Mar 2024 05:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711543450; x=1712148250; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X5+XUlpPqxzudteQHjuSJRjlJzQJhMWAmtNdNyAF5ks=;
        b=SnYTSLYsnnEznMwWdaj+/lVxeBBgU1Uv2EWsLJpnTC8q44zshCcDdPOCAre9UFHVzj
         YigXkbN/KNVHT4Dvqrny42Jz4QIh/7sbbJ5gbMEyjvpOEEfF47nOTg6Ijmr+G+DyUtZp
         qE4j+KFZQ9qgjUkI4gwofuIgwhTcTyU//QzW2l07MTM3yCPxUoPaVTdPM62gj7DdApHH
         J1QsVJPSB+JA/r2rhej+EnIfkO2jspBWYUEkuyDHHXc/75hxCk/iMskOmY/0RsCugnF5
         YbGH2GZJGMcHgzPyq4l4qQdS+KD6Fnzn1FE8iOXDCzUEqpRBPOuXkpLQoOzj0xUhWkHJ
         sFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711543450; x=1712148250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X5+XUlpPqxzudteQHjuSJRjlJzQJhMWAmtNdNyAF5ks=;
        b=we1XpamMO5RCO0EpAvzqx+CEstfR19wFZMCm1iKQTGynA4ajye5CErdepJmysuOwo7
         QTvfynuAOIv4dugtGZoUJdT3T/YF9QY3zwlXuMhLxzOamxJ81uPUYIH0QPGm0CQcFAme
         izmuOqBHNj8qVE1deBGIiDWkWbiFl5FbQQjNKygxgQoWzPxisylhyoFOD0nKjYOrVQ/C
         3aoHrqttgJ16SoY5t6Fl6c07eQuaGl5c1E3CqrUWj9L3THeV+XsiaeOL/Cjbyf0xX97P
         2JHlMWXwvKlJ/6CFwm4xwZYLKSIEprE7BSwdiMTdy5KpII1JUXHbXHsrRZvYdmIyBAsk
         MHyw==
X-Forwarded-Encrypted: i=1; AJvYcCXEbZ/Kx5X1b6Hqji+9fG2f1HjhWa9ZMjIxopSxhhLVF0hm7GmEIP/5BS/gBcl5bfz5Ra7fydX/x5/Q6N3fbrPpNMFjeVAwu8pl6OGI2Ziqbg==
X-Gm-Message-State: AOJu0Yw3IcVTcJjGWaBFbRzDXLZcucGXXIXyqcvFgERrzvA+O7IOyv2G
	ZrLEVdTNM7HrmGnec6I5xsEykW8ohn0DWuUo0kL0DrpbqdgV5dOCCbJrYr602fA=
X-Google-Smtp-Source: AGHT+IFLbWSGKPYPN0YUh6BVqWa7xSpn/h2CAadvs3AEXfazvc7vUEszh9lyFrb4qLDLLf1Fc9nK/Q==
X-Received: by 2002:a05:6512:11f2:b0:515:a733:2e0e with SMTP id p18-20020a05651211f200b00515a7332e0emr1619496lfs.25.1711543450532;
        Wed, 27 Mar 2024 05:44:10 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id gx16-20020a170906f1d000b00a4707ec7c34sm5379175ejb.166.2024.03.27.05.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 05:44:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 13:41:00 +0100
Subject: [PATCH 07/22] crypto: virtio - drop owner assignment
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-virtio-v1-7-0feffab77d99@linaro.org>
References: <20240327-module-owner-virtio-v1-0-0feffab77d99@linaro.org>
In-Reply-To: <20240327-module-owner-virtio-v1-0-0feffab77d99@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Jens Axboe <axboe@kernel.dk>, Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Amit Shah <amit@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Gonglei <arei.gonglei@huawei.com>, "David S. Miller" <davem@davemloft.net>, 
 Viresh Kumar <vireshk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, David Airlie <airlied@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, 
 Jean-Philippe Brucker <jean-philippe@linaro.org>, 
 Joerg Roedel <joro@8bytes.org>, Alexander Graf <graf@amazon.com>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Eric Van Hensbergen <ericvh@kernel.org>, 
 Latchesar Ionkov <lucho@ionkov.net>, 
 Dominique Martinet <asmadeus@codewreck.org>, 
 Christian Schoenebeck <linux_oss@crudebyte.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Kalle Valo <kvalo@kernel.org>, 
 Dan Williams <dan.j.williams@intel.com>, 
 Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
 Ira Weiny <ira.weiny@intel.com>, 
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Vivek Goyal <vgoyal@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>, 
 Anton Yakovlev <anton.yakovlev@opensynergy.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: virtualization@lists.linux.dev, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-um@lists.infradead.org, 
 linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 iommu@lists.linux.dev, netdev@vger.kernel.org, v9fs@lists.linux.dev, 
 kvm@vger.kernel.org, linux-wireless@vger.kernel.org, nvdimm@lists.linux.dev, 
 linux-remoteproc@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, alsa-devel@alsa-project.org, 
 linux-sound@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=855;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=BF5+L9M6rh/9q/lpIn327dnJkaSg5SfZZk5BFIHRLEw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBBPguclXCHa8ugbyDeozIgOpE40j4Ll+BWhad
 9ENvd8G4cyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgQT4AAKCRDBN2bmhouD
 1xpCD/0frLUUPc34SuflHSrw1c+DAdA7PTHGAMpSybU7zf9+DXYkUo3/yxiPsfF4Qy4uOc4Wtwy
 A1TIFzq4fwfmzfs66DCV7daHcphW3cgSZO8x4NFn3290GE6/9sgh9G/JhNPlSkKaTbG1xX9E0YS
 ElYgyZqqFS1bp9UskO+KWFQWYz0cVtjKGRWNo+D1vsgAr++nLtJQhI5dBMRyMWEmNgU9ERlvlw6
 sBveGJ8CL/yY/OPe8RxdjryyHxMMVbtY/DeyfMBP4b6SGocw6P6tWO1M+wHKtzXWXOKejwOESU4
 k0zxTyJjKKrDLlJAt6ktxKMQOZ6lu98gwv3MStUZ4P4Y12wfHsApT9p2YTkcgwlyQMcnSw25S8p
 rJbZtM9xfX4clwm24W3t3B9NPUz0rfUSLosmImepb+WAw41SKMkVfDrjkmlqulEK38p7i+op2BW
 sp/4aE1DSaOvzrG7XGUsDioZVpirWwFBKx8MmUHbXZcNKABnylTq1eU0EOOgnG8kwtp9cDj1NqQ
 kbS/mS3INL55pcWyR3AJyby7Oh+tsCQdsIHl0bnu7AQjguQ8vIF78wWBaERhxi4mdyUwQQlzcS+
 d4H43QeiFwyCny2ajatFWzipq+b2zCgNUSlTBK2oxKDHAOmy+HdtG6hp9oizXbgsNFW3NPdqFoT
 jt9qtjGBGFB6Cyw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

virtio core already sets the .owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first patch.
---
 drivers/crypto/virtio/virtio_crypto_core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/crypto/virtio/virtio_crypto_core.c b/drivers/crypto/virtio/virtio_crypto_core.c
index 6a67d70e7f1c..30cd040aa03b 100644
--- a/drivers/crypto/virtio/virtio_crypto_core.c
+++ b/drivers/crypto/virtio/virtio_crypto_core.c
@@ -581,7 +581,6 @@ static const struct virtio_device_id id_table[] = {
 
 static struct virtio_driver virtio_crypto_driver = {
 	.driver.name         = KBUILD_MODNAME,
-	.driver.owner        = THIS_MODULE,
 	.feature_table       = features,
 	.feature_table_size  = ARRAY_SIZE(features),
 	.id_table            = id_table,

-- 
2.34.1


