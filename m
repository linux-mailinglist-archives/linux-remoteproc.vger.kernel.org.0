Return-Path: <linux-remoteproc+bounces-919-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F60A88E586
	for <lists+linux-remoteproc@lfdr.de>; Wed, 27 Mar 2024 15:23:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFC42291B33
	for <lists+linux-remoteproc@lfdr.de>; Wed, 27 Mar 2024 14:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EFB314EC68;
	Wed, 27 Mar 2024 12:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EJwLZ88g"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E1814EC53
	for <linux-remoteproc@vger.kernel.org>; Wed, 27 Mar 2024 12:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711543555; cv=none; b=r/ndQAtIeS5kaqGnU4cMRzStYKOotHdkXlQHj+UdUfr8a7VFNTQ/HVvTukphYP+fPVGoDvftLlejR1vVnlW4sbhqEPilQFSFPttnYQo28eZm9v0ThxU7+0gvOTXvtkmaAsxo2eABWMsHNeYjKKdaDLGE6piQakugVp3v5C/snpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711543555; c=relaxed/simple;
	bh=se3bAL9NWlxdnI0R5l3waFKazObx3hz9jbN0xln52SE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fHDcVQ3yDoJa7g5AHs6VivMvDGwnOfbCYXWiamas8HP3GFeZiy8zsHIiRp9CFTh4BFYmMTp8eZaF/umdgGuemXevSrz9YxrBM/gTC42OpXdrHro3SzrU1KnOd/a7TkLk7Hn9A1l54JvX+wyE3xOVKZcmxA4rMpFCNVSZgBqh0ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EJwLZ88g; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-56c36c67deaso1329302a12.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 27 Mar 2024 05:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711543551; x=1712148351; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BCsDfZXw6LzB3XdNG+WbYeCWTW98m3a94TU3WahPKsY=;
        b=EJwLZ88gaXccDa7nnuQgOUcUbyxhdhCYrFPAmTMykWElnKc6RZo9P2CAkdOlNvnjeg
         lLSuqg+lIgz1pLpNoZImp778r3LjJJrU5c1Zl+n1XWqXMjuR93LfBas7ko9JBmDzBu2Y
         sMsCjrsBvkt0+yILmuu2H18j/vZQj1r+H9GN+qmJJVI9dnmsZZw6egjgWczU7IFdeZdf
         PeVAwtnokdCTspttwr7V4Ovox8pVQoomde820et6Eh0KJqwesT7e1eniGKQwsZXsoqZM
         aZd9DgKams7OHCmtKbKSm1e0Cwc1i9Mp1t5iw2UCqu2LargXlx1lIGnJ7fgdFJqRLdna
         lMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711543551; x=1712148351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BCsDfZXw6LzB3XdNG+WbYeCWTW98m3a94TU3WahPKsY=;
        b=EbY/5p7JtkegCiVaBNppDLEu2dLufKVseSLkocAyXWSgYeMZTv/JqT3e84PzxgVISe
         LI46wA+fW/w+CnHpKWrGUFwZ/5OlqJ65AKpgQugvefHzmqv3pvIyumJ3dvvKhOxhYdfc
         2THYVw5gHt38tWLCdebic37PR2ubTG4TPOHjwJcbtmkztwIH7u52m0+a0PDDQWsDlevd
         ZNbD0cBtFBubrhfXmpEbnrGDTGs00QG9ks+N/+8haTe4It6vBYFM6yj38U5kFmxC9TyP
         Cbc0b7jKS0KD1aEr1RT/gZUddHu1OHDDGFd59011ctMSUsEiTEOR+T2VFHDJd1di0d0x
         6eXg==
X-Forwarded-Encrypted: i=1; AJvYcCWDOoOO9StZhWsqriGbPITh3CeHluZErzA69xI/TVYHIC4VDh/ZoY8awVO8wlqUOIudjpP9Ql4ok+RQ+wBt9X2Qb4dYiFG7F44QsF1lWgyDmA==
X-Gm-Message-State: AOJu0Yy0gvks3AIm1HRqV3ZnXvaTMKvLiaSCsSnRprFId1IHMRr+r5R5
	amZ5Rdzth214e6ZchtZ0C3ZKZiN5IXZPIh887K2mGy7aaZlCvLLOqrk7WJnMAYuKZyvfYB9TMMC
	z
X-Google-Smtp-Source: AGHT+IHenEy2Nv09tc3hpD85ZlHlSHaO+RqOy+xZPq/kwcOthzgJhneH4ZMtAD4U4oj+26zW+LtQug==
X-Received: by 2002:a17:906:f289:b0:a47:11a9:9038 with SMTP id gu9-20020a170906f28900b00a4711a99038mr898123ejb.58.1711543550975;
        Wed, 27 Mar 2024 05:45:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id gx16-20020a170906f1d000b00a4707ec7c34sm5379175ejb.166.2024.03.27.05.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 05:45:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 13:41:06 +0100
Subject: [PATCH 13/22] net: caif: virtio: drop owner assignment
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-virtio-v1-13-0feffab77d99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=759;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=se3bAL9NWlxdnI0R5l3waFKazObx3hz9jbN0xln52SE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBBPlFuOYVkS3jCI6zCCRPhdDIeMDfV433oH2/
 VlG3qjMpOSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgQT5QAKCRDBN2bmhouD
 14caD/9pMti1eDVhObtjCsgc7qTxe4R+2U8ygVWuBbWTo4uxbl68SspsNCbn3wDquoXUfUJpH0h
 DAIBtQ8IEKNHp+pM30oT2NKYOfbgpk00p6t4L9oUqzhX8ytHCVAFojpdX1VqdZN//zwPu905ECZ
 8gJVLxWpQfs62Y9P97p5hkwcw6ubEphjm1U1Eo9wBa0mKhDPudQoGcIzO5hnogEoMGlO/lpNamP
 gm1H8DQteD1xtI4J8rPq4nhK/XC/OSaQKx8oodldJ35QExmQ831aVHRqzw2NCeSXMT3iv5+TIGv
 tTz1KRSwLG7fngl+72ebxNZiS1dPiGoheeJlDBxe5MMnwKVgzrxl4jil3eygmp4teE11VbWZLIx
 DytJ03jm7lJVeFeCRnij5joDyaRag2+C1HYxrwExDC2/438IMK8Foz1bZ19dUOpyp+j7UJLI2my
 qF7dydwkF3emHbHhmlBXuONlp2aJJDQZpTyubQWEmmXQX+1u2mnl60qwS4hBxMjiQW9JNTO6RSY
 V0A9gBxyrswSNxjAEs62V1NfsiCn07pEd/W7doeL9qtgSW9SvFccds+BhprZK2kktoUUZfSfnZt
 +5GMrgvAeA+GvuIbO4pQ3SQdqJDNznRq22k8JY32GZNmDmAeWkXXkATTYibLhTr6pwr5sDpaZuh
 1V6X4s4H6cGDkTw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

virtio core already sets the .owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first patch.
---
 drivers/net/caif/caif_virtio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/caif/caif_virtio.c b/drivers/net/caif/caif_virtio.c
index 0b0f234b0b50..99d984851fef 100644
--- a/drivers/net/caif/caif_virtio.c
+++ b/drivers/net/caif/caif_virtio.c
@@ -782,7 +782,6 @@ static struct virtio_driver caif_virtio_driver = {
 	.feature_table		= features,
 	.feature_table_size	= ARRAY_SIZE(features),
 	.driver.name		= KBUILD_MODNAME,
-	.driver.owner		= THIS_MODULE,
 	.id_table		= id_table,
 	.probe			= cfv_probe,
 	.remove			= cfv_remove,

-- 
2.34.1


