Return-Path: <linux-remoteproc+bounces-922-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D5A88E5B6
	for <lists+linux-remoteproc@lfdr.de>; Wed, 27 Mar 2024 15:25:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B1B41C2D18C
	for <lists+linux-remoteproc@lfdr.de>; Wed, 27 Mar 2024 14:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C72EF1C130B;
	Wed, 27 Mar 2024 12:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B/zyi0T0"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8571BF1FE
	for <linux-remoteproc@vger.kernel.org>; Wed, 27 Mar 2024 12:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711543591; cv=none; b=cm/4Bbjl+FvwufzV5emn6/H+2gWKiDwWjZaW70PJA4qBwwOaVnppwrwG+YDzkyP0q6bXfAPBVkW1SO1ZbtZMdsenCOURt3ovGHeobjBXjz3O77C2rdAN5GRFvk8IDVrVpaX8chlcZyM5Yndm6XNlzBE6qQrcNW7C1Grer6VHyKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711543591; c=relaxed/simple;
	bh=e4tuqmxOKBa98ztbKNe5ahZH7OqQYiz2j6eOquWzBY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UzDQW6bBfAak9Hzm/RqCpvlnrAqgyKvmUmdvgaxtXfZ8C+YY2Yehpq64kKU74+NxU0BNa9NbcFLPv5ZrR5K1zbEJn+FMqC7+UzUTRf/4NMAot7SP8eSC37dhmhJZBrheqfeKoFmBZjQEj6R+K2XrwFNbvrbWk8tntrIxwzWhDO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B/zyi0T0; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a4715d4c2cbso850509066b.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 27 Mar 2024 05:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711543586; x=1712148386; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O+IWUZpRkzyHsZ1EONPtdPXipfrRjQDoO3m+/nPtb0s=;
        b=B/zyi0T07MSzxkZFw6jRlYyfAFDnTz9I183zbjMRKOeRuTQA7LJr3QcMcUGwcKKwYZ
         dCrkDoKo2AM3oTTha5oGxB0+oez+luunNW7Rs6X/xzZIFIJRdCAy+HFPPWHKzHzOjXyX
         BVc8mLwuc/4N1MAcJDYG2udd1m22N1mPDFOAxbaYLKyy+pg3z8juqLE9BEPPl52NZV44
         N4Vgyqlx8N9pi5wr9hl/THUiEbW5Y6hX31gZyfHT99EH+w92/irtLQzG1NKwKiXMw9RE
         C9XK/4WH1/7+CMn2Ow8rHqSQY/mj80A3HUtnW/kGGvBbfaiyj6nKjUrx5rGDSadEN0/2
         pe8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711543586; x=1712148386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O+IWUZpRkzyHsZ1EONPtdPXipfrRjQDoO3m+/nPtb0s=;
        b=ssEonGJL5aFsKltCH0EvFIuqB5Ffx/i2ZRPjUsB3kDYxFfehrmdgL3chuckgX6VG4t
         S9hdOoQ0vT4bvpYjLhf+TVnqdEJF6OF3FHfeSjIa5uEeHN5QExy5iusgTVQPKZRXOdoJ
         mOQI1NBJbTuQ+8dD8CmSh/XqTQXQlaTSOxpAonxMKDdKW8zG6VNmzGJUY+zXS5Dxxod9
         5CGBnrDVtKIxuOp/9N/Dl+2GViAFIB1CcYK4PzvalGmFrSeqLtUREZlgPSMggmnQJ5SO
         mg/ROZecYNLUNLawelPnIZcztxlUdA4T4x7ZzTk+5m3s+4ZRaSQ7rIWK/TqJDy2LwYJV
         eGtg==
X-Forwarded-Encrypted: i=1; AJvYcCWqPLARXSVdNX8jAZovfqLr8RGyXkGFaCTQHUudT78hhiWGWZvOSU4YQjW+Qf8bXzZUA/of9fnZvjErFVrbPBu9vlAhq5AnfUjNe7rVT0jPyA==
X-Gm-Message-State: AOJu0Ywdq2cIoshCfr/xzqsXXXYHHzWv428pZAnu4R959LgriJVDbZkD
	rDmqbKpTmMDImKOxbOSq/wi7cwe1QNVTO4SkQraXtlT0zSN/YiMvEmI3PwmoYH4=
X-Google-Smtp-Source: AGHT+IG2dSVYwW41YyxFl8L2+72RN1VjLw8RGY7qnXdKzq9R9HlFqY7tKkX2f/OS3beqMjM8CcSpKg==
X-Received: by 2002:a17:906:1f06:b0:a47:3447:865 with SMTP id w6-20020a1709061f0600b00a4734470865mr2682248ejj.19.1711543583858;
        Wed, 27 Mar 2024 05:46:23 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id gx16-20020a170906f1d000b00a4707ec7c34sm5379175ejb.166.2024.03.27.05.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 05:46:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 13:41:09 +0100
Subject: [PATCH 16/22] net: vmw_vsock: virtio: drop owner assignment
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-virtio-v1-16-0feffab77d99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=780;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=e4tuqmxOKBa98ztbKNe5ahZH7OqQYiz2j6eOquWzBY0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBBPnJZccFFcsTC71qi3rWiChFCsDKi/n7NA5S
 9gCWsoQ3kyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgQT5wAKCRDBN2bmhouD
 11kQD/9Yyyt31/J1DNX/ZeAWMMLbWssZCX4BMGHD8pFfBmo0a13vKCRviFp6P+QgJwr8QJktJP1
 51NJFIL0+XcMjeHCOX9Q1o13AubLMsthey1o+p943NOigCDmCwR0XFjWObwAV0JaixfuBieUU4V
 CzgDjDRlFm/yo6UkAZSVWVOBGq5ZGWHjr/y/dltUYkPxsTrHMqs7txRfPV28UvVq1YaGVuv0g7d
 o6LnBkhn194eI3iC8+KaOWWhpXHTnnQbjDY/pAdhYhOxaqyDJmVoW8CAHf17IE3P8ytRzDJ1vD/
 3F3fig/nhdA4yJNE2cn9np8a89S9Io+YjF6BGG69rfmS2YbN08qBcpe6KxDlAAmSfDd/rS9C1NU
 /2Z3JXJG1gScW5kyE9Z11TEG3fczxFE/mjACgdEKc5wsNJKF3Z1V1C/TODcuJ6rY+AlEFnpBdmm
 W8JHP+EDJeKgCesnUn1lZoav6lpHQmm2aumMdGBZcqun4y4v592cLUBc4kePXBanOo1Gojg2tBm
 1VFCXxS6tGgFaYn97GKxZSsEDRocYb9cGqKZRH+Snw29JoSMDVlCVmoKPBTcV66MO/JYUQM8yDq
 /Zq1Z+DMT8wcIVUrYbA/3nnxn0mcpz97oQjoQILvmJrmOw/mCkIWlSoE+PVGjMWQT+dgwUOyODX
 cQjcPnCVCKpCQJA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

virtio core already sets the .owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first patch.
---
 net/vmw_vsock/virtio_transport.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
index 1748268e0694..13f42a62b034 100644
--- a/net/vmw_vsock/virtio_transport.c
+++ b/net/vmw_vsock/virtio_transport.c
@@ -858,7 +858,6 @@ static struct virtio_driver virtio_vsock_driver = {
 	.feature_table = features,
 	.feature_table_size = ARRAY_SIZE(features),
 	.driver.name = KBUILD_MODNAME,
-	.driver.owner = THIS_MODULE,
 	.id_table = id_table,
 	.probe = virtio_vsock_probe,
 	.remove = virtio_vsock_remove,

-- 
2.34.1


