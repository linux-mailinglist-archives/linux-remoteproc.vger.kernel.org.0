Return-Path: <linux-remoteproc+bounces-917-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECE388E56A
	for <lists+linux-remoteproc@lfdr.de>; Wed, 27 Mar 2024 15:21:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E824D299805
	for <lists+linux-remoteproc@lfdr.de>; Wed, 27 Mar 2024 14:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1A6314D2AD;
	Wed, 27 Mar 2024 12:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UY+nkERF"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A002514D297
	for <linux-remoteproc@vger.kernel.org>; Wed, 27 Mar 2024 12:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711543536; cv=none; b=AnzArKLtjyH7HkO946711oF0vfuHn/1OsYaonHiVrfiPGkXlZDleizBgLVISXmXEQ/GJH57lIg9HyRnY5cmTiyHRTHJfJP4pjuxz7ncEfFMcu/dCEUHWoLeVVcHtZIt4meo9Nssf61sqcC4yMcUUL+yqzaZVZP1ItEQqpfp2TiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711543536; c=relaxed/simple;
	bh=jCwmMevYkV3Lqd1Wbq1GxwStD6bPo7hGezrcOjB2c0A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pc+6D+bUeoOklje59HN5KjvJxlKfvsAjl2Ypkk0pPOCHLB5uYTrzUIcGNsyM+XPXTBBMTxu+OwrN2C+vCq0pxjSaLp1vXO70bujPjfCSRpp/XDAuLhspj/+EUVfATp6jdAQ5B/gv0q8ymzdHxbvtim//i6k5OtxpnSKgQBTdFRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UY+nkERF; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a474c4faf5eso438347966b.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 27 Mar 2024 05:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711543533; x=1712148333; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=No4VShp4MNQIo4/ZHdyujXMPexV2jpx81+F0aVzAh9c=;
        b=UY+nkERFr/YlW+5xVV53crYMg/3iD1rZgyYlGBroGnN9DKN1IiDs1quLsjbg8TsRLc
         0z7atrPbRb8Y525lo/dgcKuAi91jTeXurTkYbCyXnqbptYbXwdCabn9HAA4rlX+8NiA4
         FoylyfGjlEgDDS8lQ/AD5hI1mMjTelVxIEZTfBuYZVt/mFEtWPebI4gCHIvjoXJS1UIT
         nadzHxn7SEyqo1xiJhu+6XVvgZtKeMC1ldwFOjrLzYOACjoYGGssFUBTO3zyQcoYB/ee
         ZC+7ddY8nx6WkMjsPtkiVputOn7zaBFTh/oAh+cI0DdKU6tACmIjXe9PXybxtOVpjdO7
         ZAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711543533; x=1712148333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=No4VShp4MNQIo4/ZHdyujXMPexV2jpx81+F0aVzAh9c=;
        b=HvERG4/q3ICGQlmo3rAM0tqbZmrE3MR6LUGKRdvi7GItzMurSL32zHFLJUOvLSw1Xa
         tBgwVVQIMTwI/QEU4fwa4j44QzijfdRFbtizamDfQ20BgBPgC0tVwtMsggIYF4GoKhRd
         Ve59AbNVXNpW4iVjtfXNSYCETcZtrGSXFMfV6FJjTLLJphze3Z74kYCZb1seI7S0rxCV
         waJq7P2DKGLkxE+r8M29x/N5FGpg9aXRXCTHvtaAxkMO0VtXkn7RBKCkUeD153XfZLku
         Hc+d7GfVWz1Dh4gZG6Af6aSUOCDz/K0cGWTVfvzM8bif/+5VTjyqOZzIITaVItRKV4N/
         H4zw==
X-Forwarded-Encrypted: i=1; AJvYcCWNKb7twncJlfUTwTa/IRx5o5oS+T+T/HP+eHHhdjVE40L5YQYnktehp7bc6ruYuTk3hlDNFP6srrgIVWKpb0qJc6pzGlMYP1ZAppsx0kdkmA==
X-Gm-Message-State: AOJu0Yy0JpFimuhIPDAGmnr2VLdHZJnGfqoemdlz/zVIwcQzSsZTFIhO
	ubNmt6q1UpZgOV+GC1hBdYVRnTN4w+a+uut55b03j/eWPkhX9qXBwY6x/oUNzTg=
X-Google-Smtp-Source: AGHT+IGcHd2qY7ZBro2wyisxjF8vmsU4S1L2u/P0SqS5KVxX0CKJYhU9jvIT/xpw11DDb5r10WYfVA==
X-Received: by 2002:a17:906:f2d3:b0:a47:35e5:7da0 with SMTP id gz19-20020a170906f2d300b00a4735e57da0mr825525ejb.41.1711543532979;
        Wed, 27 Mar 2024 05:45:32 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id gx16-20020a170906f1d000b00a4707ec7c34sm5379175ejb.166.2024.03.27.05.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 05:45:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 13:41:04 +0100
Subject: [PATCH 11/22] iommu: virtio: drop owner assignment
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-virtio-v1-11-0feffab77d99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=741;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=jCwmMevYkV3Lqd1Wbq1GxwStD6bPo7hGezrcOjB2c0A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBBPjcRuWcdv+n/Al0ahdDHsSs8WafHdIUlLGa
 Dnt3fJtJ9GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgQT4wAKCRDBN2bmhouD
 18avD/9TrqZBBr4oeroLUMQVYofN5TjAKsnyKZWl94vQ0iYfSWHuOlNDOTMSN2Dt08NBk9v0Xs9
 eUeYmPAYKRPRGkVuIDT6wOGW74KIxf5Mzb+3Ds4U2QrJRdXG8f/ICyRsRD1pHENt8cK7rI+E6zd
 umkuE/KYrQKTdXb4i5CHK+4jJ+DeoSIswuO/54AUq+E3pgGpFpdxxhj3208Hfz7tvnh9pgJmVh6
 zMv18OlPg2XfxZF78f5CFbftrBco7QM6ZHNrOk4RVql8QzSC7xQUjkGRYbxSF9HZVWgRUQh2WXF
 xxDK7TkVVSHfRKctSH//72hik+jo9foWddmeNbFaTrbXNjnnfnMRGMsnzz2EPFrHjDeT61LqF0T
 u8SNrNOpi53cLv3XWw09T4PdY+XEqvqtEOvJNJ8yEihBPgdwlfuUFeotY8G4XEtfN9ajZcjpkdP
 F6UV6cNFIDph+aGoj6T5rloUw8mjhJCO8p2f/T4HHgOs9RkcoLnb4zY9lprMxc6PMlT2fC/AaSB
 JwlRKgB9FMrOWfSuB5JVqDAZUUoNi3ycrmnq6XQAxs+QanigRO2orLbBXUxhmwRrcORCAXzAY/m
 L00b+Gn5jqZIFKGhzVfYaO/NbGgHZGtdQ9ZEg14BZW6tIdbpC/y2F8V6vq4H0WyOMH7b1wZ8HiD
 Mj246oViTtDiKNw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

virtio core already sets the .owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first patch.
---
 drivers/iommu/virtio-iommu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
index 04048f64a2c0..9ed8958a42bf 100644
--- a/drivers/iommu/virtio-iommu.c
+++ b/drivers/iommu/virtio-iommu.c
@@ -1261,7 +1261,6 @@ MODULE_DEVICE_TABLE(virtio, id_table);
 
 static struct virtio_driver virtio_iommu_drv = {
 	.driver.name		= KBUILD_MODNAME,
-	.driver.owner		= THIS_MODULE,
 	.id_table		= id_table,
 	.feature_table		= features,
 	.feature_table_size	= ARRAY_SIZE(features),

-- 
2.34.1


