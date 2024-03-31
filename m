Return-Path: <linux-remoteproc+bounces-979-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BBE893014
	for <lists+linux-remoteproc@lfdr.de>; Sun, 31 Mar 2024 10:51:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA2931C21179
	for <lists+linux-remoteproc@lfdr.de>; Sun, 31 Mar 2024 08:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25F8C13541B;
	Sun, 31 Mar 2024 08:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TTod6bCj"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46A71350EC
	for <linux-remoteproc@vger.kernel.org>; Sun, 31 Mar 2024 08:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711874714; cv=none; b=P111NHmTxQgbp8hivmEQxHEv1PhSvnV0Wxkjk8DHxSQecHAEhChJBfTcoBQpQVIY0Kn9JI0OJp1VRnXY0c+96p6CtakEENqSduDTRbPbEmbE0jDVwVokV3FskGayiYSOZ0aJRflFZP9nd1Pqp2bZCmzKgbwIY9jEVMNR0cB0CvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711874714; c=relaxed/simple;
	bh=CUCGqZGlbwrgPkwPeA7fzEXfYZ5lWG+kw/qtWPfvSV4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E9QCdmrgR5YLvZhs2wkqPxQ8P6/nBAQT7K3cXNReqCgFb9OchHD0C3R/xetQ6XVdyomN8GY9Z1LAz+DaYqqqWTWVchrcBQJU+EECFbpBgREWnbep+FIvxaeEOaWrKu0J6i5HUhJuofbrtYcnJZSDRrkMKz06iKweOtsMATeX/XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TTod6bCj; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-34339f01cd2so1605147f8f.2
        for <linux-remoteproc@vger.kernel.org>; Sun, 31 Mar 2024 01:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711874709; x=1712479509; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EPamPBtPxW6+pkIV3m4EaBMhb46zDx5KgvXpbm+zagg=;
        b=TTod6bCjaJoPNaFr5YdI7rPgKAA01+G/mRP3eemoFPsyg7IGQtUZFZ1tpXn5paZzOD
         u53glEo6uVWe+mObDnV1u0r8DhOqK6hZDGf716kkA9M7/Qt46qJu/iucqBuJ0QQhQDlf
         WUvU/az6MgWIF1C63aO10EgmTNNkbj0eggKewFKzd6MlBIO9PmnBKZjZuDJJcYA2lsQu
         7m+UmbR/HaZQNAkYlIzkgf/fJ9ahGTRnwNWMVaNRSv0mSkl6CTA/emP898Oig4KYdJtd
         +qrM+5c1l5oT2ofGf9D1DVD75SnRyAsGg+pFMW6WbElZIimicDnYkN10nSAUjYleEXso
         ykFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711874709; x=1712479509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EPamPBtPxW6+pkIV3m4EaBMhb46zDx5KgvXpbm+zagg=;
        b=VntJMuf6bAnIaaqGiGapguKbuQg8lgyM61lIcOYU5hh5MukdGTVHihNByAabSsCIKN
         jPcmLWFf1Vqz2s5pf3aJl/nYfiy97sLCAcoItbEaysWe0rEKRUavDhNeXi4h8A2ZYn6C
         AhoDXSHtAqzF+ksmmo7rtiwJvt1y019IIrLbrq6GEHE1Q3uZnKbev/2LBqc7Je85Fkqm
         R8HpPUe1AGYN1GbK09qFeNH04KaDOlej1H8bm/peidD1bjSk64xZbMhCIRE1F1MmYO4y
         gMxKLNADh5/IZQIxJMxIKEWBNfMxkQ0757AVZIMy9HpbnbgHyegWm0E6nsdDoQ/y9Fhl
         bAyQ==
X-Forwarded-Encrypted: i=1; AJvYcCU71g1xW+uK73wn3cc+78gUvFbFbR64EOSUsrJ0RuKITXUpOpVSDskfqMNDprU097BNc+WcMnsXH3vyoqBkYykWvdHPS7dJbzqW981vVZNKng==
X-Gm-Message-State: AOJu0YwsTwCGVgJhoUMqtkyk3HT94rLby7jTybqqz8vyWEvjB7qcOTTG
	HeU+/d/97mVKY3V6uThUIvUtZ+mfPSU4xU5k0hReAIYdmt01hCkoAVNpOxcOCd8=
X-Google-Smtp-Source: AGHT+IG3jSNF7268J0E1HJfmQrmSXJ4Wl8mFjBEZXGvEomzawa1g4Wm2Mox5PQKcv6wxXeChlF8YxA==
X-Received: by 2002:adf:fe87:0:b0:33e:ce15:8a15 with SMTP id l7-20020adffe87000000b0033ece158a15mr3641010wrr.5.1711874709483;
        Sun, 31 Mar 2024 01:45:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id k17-20020adff5d1000000b00341b7388dafsm8436003wrp.77.2024.03.31.01.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 01:45:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 31 Mar 2024 10:43:56 +0200
Subject: [PATCH v2 09/25] virtio_console: drop owner assignment
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-module-owner-virtio-v2-9-98f04bfaf46a@linaro.org>
References: <20240331-module-owner-virtio-v2-0-98f04bfaf46a@linaro.org>
In-Reply-To: <20240331-module-owner-virtio-v2-0-98f04bfaf46a@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jonathan Corbet <corbet@lwn.net>, 
 David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Richard Weinberger <richard@nod.at>, 
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
 Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Viresh Kumar <vireshk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, David Airlie <airlied@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Jean-Philippe Brucker <jean-philippe@linaro.org>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Alexander Graf <graf@amazon.com>, 
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
 "James E.J. Bottomley" <jejb@linux.ibm.com>, 
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
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCSJY2K0WgWstI+JyoJVlI8wvHUdkoPQyLPDHn
 4y16zZ8fXiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgkiWAAKCRDBN2bmhouD
 180zD/9DCleQCk0epueksPN87k8Rp6GpcfhV+x4ryTb7+1K/feJB0wQfepIMa34bCTenS9UDOq2
 17ccCayDu3cNPaVqPJkWZB7UHFd3M2I8rG5Zqv528TsLUB5P3GbKEzcbyWqO5e4agxHE8cl7Tj7
 WxP1hYOzNaXSzfgBdmLEdZnCkyjCjsj/RIsXHYE8MS+ZSxOj7lM0opJpEh0nm1LFrwJ2qBc7/He
 vC502dc39B5RmOcBsqj3ddPhdRhpLfNdx4gAx6ZVOKGRozzVnMD+nk2Fq+qw5cTF65PYbNVfiW3
 AjKdSMYJ3DeXggQXymSeoR1ShLp7brAPxaXnmtWrxc85IQfO8gZWq1+hMhjUZF7ufo60dkFBjDz
 mCwrbXy88PJtANZ1FIpswOU8JKtrv46Htzjm7Z9zDzUDY9iXPHJFYH1Pg/cXtyi8vzEjpE2XW6L
 SnnfiTn3zE+JLip/Gk6QPHvHJc3RjcXC8N675rP1wBc1xZ/5JkNuCSCMUHTviSCx1VCcyP9vfPw
 nrbK2ErijtG+z1HgWesUOmEVRyAKQsJr3pzDuAHRRgxKPPP7fuZHNBH1ddvq7lYw/S5sxT4q+pm
 wU3Fapsvk4HWIMkJhBfYxaHhi6SKit31adV0tbCNXvebNcsyFe6pgKRsPlRXbNuSiMeYZy4VS4p
 80u8Jql9MNv6YBQ==
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


