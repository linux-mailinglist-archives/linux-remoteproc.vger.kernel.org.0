Return-Path: <linux-remoteproc+bounces-912-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A53F788E523
	for <lists+linux-remoteproc@lfdr.de>; Wed, 27 Mar 2024 15:18:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55FF728C3FD
	for <lists+linux-remoteproc@lfdr.de>; Wed, 27 Mar 2024 14:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF9A712F364;
	Wed, 27 Mar 2024 12:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N+l1onCR"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B3212F362
	for <linux-remoteproc@vger.kernel.org>; Wed, 27 Mar 2024 12:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711543435; cv=none; b=jr1tEJjBqrwP8fkrTJj5/yc6SmTaNWejO1uCaDwhfk1J+O4I2mk1us22xHJV+Gy3XKaTltuUfYhVUApucBQ9K5OvPjiZN+bx996bDSeEa83whiY3jwLTdzgUfKx+d6uNbdqieI6acyvsC43A5Rt6bjgb6QVpemta/sBvfwj8NT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711543435; c=relaxed/simple;
	bh=CUCGqZGlbwrgPkwPeA7fzEXfYZ5lWG+kw/qtWPfvSV4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QcNi1QRvIIOIE/r2QgqXtmA+CisodMTqGy31BSaueXkYUKs8SN+C3WMYiNwp4jGQlFW4Bfw4ozDYSD8aQTWdsV9Q+ZyhSRVnu5LbiRv/cUqjP1hazJjT9glwKjbjYqOVZOP2bBcTVqeR8GUtGggUi86Kwy+Y4ySnPDutYK9IItg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N+l1onCR; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a4e0e3ef357so12929166b.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 27 Mar 2024 05:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711543431; x=1712148231; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EPamPBtPxW6+pkIV3m4EaBMhb46zDx5KgvXpbm+zagg=;
        b=N+l1onCRnEyIol3s4NLBL4mULIeYGiTX/bC/W5USHUQr+NbQJYxVzoPlK9bywJEO0w
         7/IhkmDtRqo8nIcJJ5MAsnht0LydyohYfryVfD3E44WE5To6wBoX7lGDgZjtt2gkzfao
         cju/m9Leskh8v4D4pv+f5cTKZDOumWnPeToXY6tstDAz6O5+iZqylO21k45RPRMwMB+I
         8fc5b9SsCmEkLVSjtnMpX0ETacSSVkki0S7kumCv+T9ZiTnw+jV3HdsKjIzZDSPtaJUY
         eI6c1XblMwbXgwSr3JFMBEaIsCaIUgx4DIPXzvJnE7T0Xw93/f43i98IpigUYGmp6uQX
         UZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711543431; x=1712148231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EPamPBtPxW6+pkIV3m4EaBMhb46zDx5KgvXpbm+zagg=;
        b=d7MLpLPfU5rnML8dsu79i957Hbh+51myywf+rQ+vUfYjV/98DCvx+e0FvoZbqRDwkk
         QrwBeoYZu15+t/wdN7p6rJM7QfGGk6KGcCFMBF9uRVKx29eTPOPgSB7qMshqz5p5k2og
         2pEAnS3/1qtuTM7U3Ey3i4HQpD1u/XvMrQVUswACXqc2YzJ+8Y0Yg3MIVATx0QaX7kR+
         2IIZQTvHY6bq+0adPYgoX2iFXQAzHStNPlNvR0C9FOO89oYYxNSX85KV+pRQw0Hba/uF
         UMY0NGUmyze+F0m0frNyUYmkvN2COc5IPOWGB6ZarJoXgVI26UQUXGSOLHK+Je03PMpe
         fSIw==
X-Forwarded-Encrypted: i=1; AJvYcCWwiLlgs93lPfy4/qZQg53cAsxJNDmeboMVRObzRgzJq4TOELqYZCTAmH6Zmc7g0MPXB1DnjdSWcK1TjJxwh4o+W5sJ+Mh4Gxa15nL+XE0WjQ==
X-Gm-Message-State: AOJu0YzSM5Pe5+9IZwdwAh2IqlZ/lAkAMTWD4BdyvjOVvKJA7n/h3dhj
	CoQLeuNIPEIAoHkP5zIoFUKeji/aHjSGx9sLVB3DB5pgq2/jrrYpO4JLeplOlog=
X-Google-Smtp-Source: AGHT+IHIawhEWmM18csReaNkfj7KE+Mr23K/ZLmHctiSwGk/x/WXWLAILVQsaMoVXgQQh7ZH8TvBtg==
X-Received: by 2002:a17:906:4e83:b0:a47:31aa:142d with SMTP id v3-20020a1709064e8300b00a4731aa142dmr835338eju.70.1711543430493;
        Wed, 27 Mar 2024 05:43:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id gx16-20020a170906f1d000b00a4707ec7c34sm5379175ejb.166.2024.03.27.05.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 05:43:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 13:40:59 +0100
Subject: [PATCH 06/22] virtio_console: drop owner assignment
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-virtio-v1-6-0feffab77d99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1103;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=CUCGqZGlbwrgPkwPeA7fzEXfYZ5lWG+kw/qtWPfvSV4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBBPfhSNGa7v+KPC1Mr5GnTmrNcEwnc0tCa4FH
 m0oKKQdogaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgQT3wAKCRDBN2bmhouD
 17JlD/9KDr1Aax5X0o90P0yI2bf6cpve6MUh89ettR4omfAVd37Dod/vJ5UZ8YDgCWHVdzBE/lN
 pkmFzT2vbc1UL6oCj+BMBllZkbpmCkDtEvx3lol59Tz/OZUoXhv/8bDFpoyPwhLuwZBSu9GaBm7
 jl1D1sPVUPu5TFBwDqMVJPE9lNuBgpiPUVLh1Mw1LJM7U5PbFDz/797HaHICwxQCgs4Le/bzO6d
 NaHj5gx2JeWEPUyXNeThuz8Ltawko6tEtFZge1cW7WSCzRcoN7Bu3A2w3C+gsxSygfVZh9UMCaI
 F4wfQuj2fV04UAi5+OceMmgcvWbaizvgRFeaq9jC6oKv8tXcdTdgyWZb2R9kxYRYXsqdvFT49uf
 4EDLAt5abOVCXpJs2XF1Zsb6GMBJvPT8N6ur8Qx989vDOSbTxlC2I2J4pqHjgEoIpyS1EArc7xy
 cTGt0MceTl4TFQWnHh4l048GQyvV2ehpWlx9SLMDxZ2x2d/b/y07ik5mDHIZgd6e4GpGE5CwPuT
 f8/PBIExnfmQgxh6AycTHxwwJ0Ngy4B2R+bS3MR08Htxndq3Nrpu1U65K0m8WDKubEy4zaMN+kr
 hoFfKJUXhyFBrtl+Fehgcb19zQ4HSvsCzidVzGuXw4xvn+gVKRFbr3ZYDaPGyWFacIDHIhCFdn1
 FeGFa/txQr7dGRw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

virtio core already sets the .owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first patch.
---
 drivers/char/virtio_console.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/char/virtio_console.c b/drivers/char/virtio_console.c
index 035f89f1a251..d9ee2dbc7eab 100644
--- a/drivers/char/virtio_console.c
+++ b/drivers/char/virtio_console.c
@@ -2173,7 +2173,6 @@ static struct virtio_driver virtio_console = {
 	.feature_table = features,
 	.feature_table_size = ARRAY_SIZE(features),
 	.driver.name =	KBUILD_MODNAME,
-	.driver.owner =	THIS_MODULE,
 	.id_table =	id_table,
 	.probe =	virtcons_probe,
 	.remove =	virtcons_remove,
@@ -2188,7 +2187,6 @@ static struct virtio_driver virtio_rproc_serial = {
 	.feature_table = rproc_serial_features,
 	.feature_table_size = ARRAY_SIZE(rproc_serial_features),
 	.driver.name =	"virtio_rproc_serial",
-	.driver.owner =	THIS_MODULE,
 	.id_table =	rproc_serial_id_table,
 	.probe =	virtcons_probe,
 	.remove =	virtcons_remove,

-- 
2.34.1


