Return-Path: <linux-remoteproc+bounces-993-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7763B8930D7
	for <lists+linux-remoteproc@lfdr.de>; Sun, 31 Mar 2024 11:01:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DE73282BD8
	for <lists+linux-remoteproc@lfdr.de>; Sun, 31 Mar 2024 09:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE8E3148306;
	Sun, 31 Mar 2024 08:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rJzm9LV/"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9EB1482E3
	for <linux-remoteproc@vger.kernel.org>; Sun, 31 Mar 2024 08:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711874777; cv=none; b=V6tTJn5CzTNIZVChxTohWovLTPKA/JvrNslXwKbL1jSq2AD4pF2ruZsEHxbVG65PCJB9tPCYiZTmZiOsOy78239itQRAgsJsi5pohCZVgRMfPsz2RY9cagSBxv6GD1b5W57ZH5Gust/1URxL64wwP/cieAJvx8+3+zQuDfW6rjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711874777; c=relaxed/simple;
	bh=uyHTJK9hGj4pUuhGRoNgYjpldlN5umhZQCXC4Cf21m4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HJPKTXqhXe/2GfunHm/jCcDreA0mVIkrewlFCiPAVSi3h7oRin6V5NYbD2eGwFZiDiR7wS+yjJiVgxwkqBUfvOoYEpGKe9mihOOtklMpvN+xdafXQwLnX3/D8PooqDJnA6JONgS8Kfqmh92Pxsf6ka88plHIxIsBluTJ/6lz/Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rJzm9LV/; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-415611a1ac2so1381275e9.2
        for <linux-remoteproc@vger.kernel.org>; Sun, 31 Mar 2024 01:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711874773; x=1712479573; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xqx8EsOfIsEAxTTB7WrsmLtXzdf/jwAZollbLpRLRYY=;
        b=rJzm9LV/xIU0E/XrWu+U3m741UhKJki/0Zhj3XdCypXwZovcbfSEd7F96UaXNfcD43
         3Z4Hn3HEvo5bMoFkRgk/Vx2HGb6hmn8AzcUnD2jIsQDgY1gPrI75X2ibSFAyaqwPSNOE
         n0UoOxuydypxGa/pWFECqMlBbeWWId8TiT5tLzWmRb1M9A/BZF/CUztC43+xtyX6wBJV
         voO42UJ532bbidNNJv7vwyIS1qNrnYA+d3M7pNSwvLxN02Nkpn4zqUKssxtKLaSagCo/
         TYJUPXglAQs/GkydcX6HPwuA7Bh1OpVEMjFXwGSrMDqH24LcR3qAqzoEqGiyKPqaafWS
         8u/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711874773; x=1712479573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xqx8EsOfIsEAxTTB7WrsmLtXzdf/jwAZollbLpRLRYY=;
        b=Wu0+zHxLTHkhPueEhCPmSrMdICS8TCovz/SkAXY+VPBPx0OjKhI3AEVzUFO9XhijXe
         ab5HG2tUzks2r+5QEutylGSEUynHOQsFhbnHe47uMkW05u+PU9/TVZjf/xdEuJB463OA
         j/WfwXLnixqP/QCQtdZTXLtC76v6PlbjJPz5uPwxBMFiiQlkTeUJadSUG0/smh2ODYzn
         RJ0JvWJfmbyz/qnKbD3xzpBLxiyUtZrN2IzMIDSEebYZdsLIu1knxwXt+TxjKvzdzqxg
         TX5fmkW4RZOJlChnbhfbAbo1w9FJvskv820/Tm5+2M8nZLzMeQe7J/qeTxOpdBfSFHnA
         IVHA==
X-Forwarded-Encrypted: i=1; AJvYcCU7pnpXgjfvBVFFimIVddf4Mfnoyq9LUnvGbUnkZmexJ2qyWSrgoKUT/60YPj+MYstzn4t/Wst75geCTXL5EGB9K9XgUm7NnvF06dqUkaqj7A==
X-Gm-Message-State: AOJu0YzPuCl5JNhKWMPApwAfzrssOjNGuyTFDL8PmUYN9maZB8wFy2BF
	l/w62i/YwaNF4g0HeRw5ogJFSqupq4SCwOmCRlAe9woemLA7zFf3IahtupM149M=
X-Google-Smtp-Source: AGHT+IFek3qzgbs7V761yvMbVzXmLG/9C3zAsZw/31BGdAd97C/MQ/TvoSMIOusJu9yQQnnC5pkHjw==
X-Received: by 2002:a05:6000:4014:b0:33e:5fb4:49d1 with SMTP id cp20-20020a056000401400b0033e5fb449d1mr6156006wrb.44.1711874773612;
        Sun, 31 Mar 2024 01:46:13 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id k17-20020adff5d1000000b00341b7388dafsm8436003wrp.77.2024.03.31.01.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 01:46:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 31 Mar 2024 10:44:10 +0200
Subject: [PATCH v2 23/25] scsi: virtio: drop owner assignment
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-module-owner-virtio-v2-23-98f04bfaf46a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=738;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=uyHTJK9hGj4pUuhGRoNgYjpldlN5umhZQCXC4Cf21m4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCSJkyB5jVftWfHE6Y4WAM9qzx5c9F5f36NaXf
 HDiLHSFtbSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgkiZAAKCRDBN2bmhouD
 17E1D/970uhi6aEAor+qvSHFSwwBAIJPIudirpecSG58uZQ/z3MqIYltLYSOACKb10uijVFD58+
 xViZKnO6uh4f+Scn1y4VoB1/wB7kd4gQiTLtXkEUsX2CBxLZIxfM36EpUpmaB9x5mLST1Nnf8vx
 2q1ivSLC2iO81+g9NTGaqG5/4hm/krk7IycxyRZKMTbANGN29VIzgRLESpCC5nlr3u4klPWJC76
 VDKWnuvE+/NuIQg5FjVC7xPBBtPsQmC/adjVD0fqPRvSVcssbIBQ00wGlBtyUNwQHBtwxXJ7WfD
 0hzpaUVK8B+NrTzlAhFLCQm/cBuQ17psr/l71CNhX371mfd3i/KQLsD/LcmOg8dauxl6qiwg8EW
 qQnwJKIzj0dDl29fLhdw/iGVPcY2kvTFzSbq8Pq6r+UhpzzUm2BF7NtPH1e3YBVWgqDF7VpdqqJ
 T9CVzYKDp1RUwO9GRK7EQkyXRTS9I7HS2Jc2ZzECeh9nsgIXXMCiqzetYxe4zxDrE/lyjtgIOR3
 pzL6XA11CY5Kk3+MQeSAgPJmSlOyWlTs7Wr5TJfR/iLdaPwmazgHkK9vQLKXXZ/CFvEHoIGqNAm
 Aa/ek5+YsjAxFpiN6ZkIUqwtcnmASjZiWWmA8VQ2WNEHXNdEJmbZMPEKw5duK8bIkb7CHicrfWT
 kBJS4txpYhAnWuw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

virtio core already sets the .owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first patch.
---
 drivers/scsi/virtio_scsi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/scsi/virtio_scsi.c b/drivers/scsi/virtio_scsi.c
index 617eb892f4ad..89ca26945721 100644
--- a/drivers/scsi/virtio_scsi.c
+++ b/drivers/scsi/virtio_scsi.c
@@ -1052,7 +1052,6 @@ static struct virtio_driver virtio_scsi_driver = {
 	.feature_table = features,
 	.feature_table_size = ARRAY_SIZE(features),
 	.driver.name = KBUILD_MODNAME,
-	.driver.owner = THIS_MODULE,
 	.id_table = id_table,
 	.probe = virtscsi_probe,
 #ifdef CONFIG_PM_SLEEP

-- 
2.34.1


