Return-Path: <linux-remoteproc+bounces-910-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A997788E504
	for <lists+linux-remoteproc@lfdr.de>; Wed, 27 Mar 2024 15:16:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFE891C24756
	for <lists+linux-remoteproc@lfdr.de>; Wed, 27 Mar 2024 14:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D66148822;
	Wed, 27 Mar 2024 12:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nBeOP6YQ"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586D5148312
	for <linux-remoteproc@vger.kernel.org>; Wed, 27 Mar 2024 12:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711543376; cv=none; b=owP4NIzy5zzZYftfunEpoDenuGhUNfUAluBhk1LyODtSu2K1/9LRpa7jQYlmDcGgaWYIfRzNw7w8gsx7eudE5j7rrSCM9uCAWJ3qLQHCjSvUSM5XLVu7GqnJu8UdAB3aejdvTdUVCCJMhCin5NI1oN0mdYgaUlgWBf745E0KnPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711543376; c=relaxed/simple;
	bh=RVE008LGGmmk5WXgZGxtm6p/ays+12n/AyoNVnX9umo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r12+FCod5LnEl+TBJGKsAVpKp+MCJGoo16Em2HD7/UxHvRJALW1iI+49ET6ZFA78l0lKGdsl4jBvD1EgWfMqsxSyNJVUrzpYuJSpVs0KYwFzzxIlxP15MNgsemm1sNmjZpwhnqqcGSngLEchLKglknaOMlH0cn2lnVJvCmuM3dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nBeOP6YQ; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a47385a4379so152380166b.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 27 Mar 2024 05:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711543371; x=1712148171; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/vBka3ABZcniwH/u8QWX2xHT7esEXtapMcD7AcTvpic=;
        b=nBeOP6YQwW711m5i5jDQY0Hd3rG0tK7i7IpNf/zCNRa7dmLz1sVHpCTTzOcmLaWZaR
         fv7WFaUXVxb+E9GYEjNzNthLgqFJkLL54ZTi2/++avtlP5wq0ugb/JINai447NPiJYfw
         JR6TDwwsPXJ49P3uX+ryFkaTJb96KGrFD+lfJuF2/HhSM7XnY/EicWxVpk/mcYpuhW4b
         fpNl5RU6lEgTiWU7nUEPt4GbRXLnGygkmeKelOuW4zRJqdHsJAec6qkpLwmYzWRAjrYT
         gS0U/Y0+0Zq4GbYDVIiOsgUCTAvTquTPdHpXTP/Ma5LWv3FJwMr79AL1rKObI4l5jMN+
         g6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711543371; x=1712148171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/vBka3ABZcniwH/u8QWX2xHT7esEXtapMcD7AcTvpic=;
        b=CRDjOht8xr6hObn/gVBabb0BmckBe7j/UtgAvIxya3+tL8HzxPoMoc6ekQHJJNYuEs
         xDLwFd0d2WV/FacqSpKSGODhMWexsqNfpJt+1aRc0fSanqilBjgBJ7ojKgHjuSxQLiiv
         X5UR3ENiPck0FtfyWtWw68LONSbqP2m3d/XbnzQouS2BP9jNJKTfuRa0LD9Z6GfingIa
         suR93ODtbgO0A0ssO5s12r5EEb31EHhw4b6bHODkdgEJcDs041aPEDTHT8XN+0ZiL7dd
         NyI+ZYuo3DrD5FBPGKTyh2UzGtXU8z+6H5sC8jgPecL0tFh5AUcP09E9fWi8D4CT1idG
         I7dQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6f4Swvzou2glSVS6bBPgcpDJVcTcvRHE8A2tyLXrC2n2iZ6uPdHFHduzv5fCnIJAteb3222nLJLlY5mngB2NrswyS6K+0rj367LSbv4R7+w==
X-Gm-Message-State: AOJu0YyziB7AQX8coUqbKIL9T1OW2j0cAsd00CgAKomdDuxBBo16pLBb
	3Osfb49HXClwo1DgWoKXtki7mVOXlYmL07s9glFekxQl9E4Oe1H2plFguCdKdZY=
X-Google-Smtp-Source: AGHT+IG5vuCEMnJybNEU3pw6Dfhrha9UVjffnJEN9pSayVDfDg6+G0gg3OeqyhGazXN+XfbDGEL4yA==
X-Received: by 2002:a17:906:5645:b0:a47:34b5:fa6e with SMTP id v5-20020a170906564500b00a4734b5fa6emr3936509ejr.2.1711543370618;
        Wed, 27 Mar 2024 05:42:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id gx16-20020a170906f1d000b00a4707ec7c34sm5379175ejb.166.2024.03.27.05.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 05:42:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 13:40:57 +0100
Subject: [PATCH 04/22] bluetooth: virtio: drop owner assignment
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-virtio-v1-4-0feffab77d99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=797;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=RVE008LGGmmk5WXgZGxtm6p/ays+12n/AyoNVnX9umo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBBPdBdOoV7iseHu8Ha4ifJV+o69aPjmkC0Glb
 hZvw0OYKhSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgQT3QAKCRDBN2bmhouD
 1wI+D/9dbQLSRFm34TU4Qv7YYw/ixrbQYbzdht3LbG49prmr+l9PRN+lDKM5C7rVEcSei80vRnM
 TiW6KxYh0V1FcMmWftM5R3iPFwUdsjSJJ8STF9/qxCFrtRu4JF2jLy20hTeoVbp18elVq5cPQX7
 x0ZT+2U/6ejc+Tj67MUtextCGgzfAnxyzk869i8eMn5+xHxfOheEJYs56sRxZveNqcH02H3SJzS
 lVHZpxQrf3FRGgcwHAPt3T3Xdw8Z16tpAtE2x8gC688DaS1Xf+F0yjXhNYUD3TZ2Nf2LOIirHft
 RqrMloYSPBljyoR9aLzb+/TS3YpVgQlAvKN5d6tmlJ0nE9har9+fKbx2BcRrLp/6GDENjqsOo/l
 8CB/SP4BTOX5vsL5yzZ+pY00Qmxt0ejqUXPkWtmcx1XbG9w2k8k24TXnlZCPdLXrLhnZ2jI9LT+
 zBfzzDbBRNwOCPfTHDN6HNuuxYCdwPAnpCXF+I0jmGk74U4igIav9OArAmrq3hKZBqbWqOZI0BN
 vbbrFOmyQQ3Nr/FfhrtNyG373ZzkyCTApUHwmnIEwpxTiKH0m+OVNyP38BY9vsn1/ZkBfOPZZyU
 LMQHmHackK+l1II6lBOJVnPTDqc4EvqiFx/LJsVwQvunku2hC9omSwT9D4Wuv363XinjYsbSqRE
 G6BGGHfVkJ9lWYw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

virtio core already sets the .owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first patch.
---
 drivers/bluetooth/virtio_bt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/bluetooth/virtio_bt.c b/drivers/bluetooth/virtio_bt.c
index 2ac70b560c46..463b49ca2492 100644
--- a/drivers/bluetooth/virtio_bt.c
+++ b/drivers/bluetooth/virtio_bt.c
@@ -417,7 +417,6 @@ static const unsigned int virtbt_features[] = {
 
 static struct virtio_driver virtbt_driver = {
 	.driver.name         = KBUILD_MODNAME,
-	.driver.owner        = THIS_MODULE,
 	.feature_table       = virtbt_features,
 	.feature_table_size  = ARRAY_SIZE(virtbt_features),
 	.id_table            = virtbt_table,

-- 
2.34.1


