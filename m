Return-Path: <linux-remoteproc+bounces-991-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 536EA8930BF
	for <lists+linux-remoteproc@lfdr.de>; Sun, 31 Mar 2024 11:00:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 097F0282ACC
	for <lists+linux-remoteproc@lfdr.de>; Sun, 31 Mar 2024 09:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64D98146A85;
	Sun, 31 Mar 2024 08:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eKn0UBLP"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362E71465A8
	for <linux-remoteproc@vger.kernel.org>; Sun, 31 Mar 2024 08:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711874769; cv=none; b=dMW7gIvjhXy7jsHPd5WZM6VJzvbFFq55wHkc3Xbs3vvqlhdtaRzgLhhyvEOCSE7G9Wi+V84l6qzPtwv4u7ZjojPvcvZzj7EbqqJ3VkhB+M23+q8mqKCx8B1w3be1FwWtRkt4gu9ejq5QQ9ne8Th6rWvIE5RUCKsBkWcH2y4tPAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711874769; c=relaxed/simple;
	bh=djiFy5u3KBh7sxz0UqH9tQzKO6FqFPG/J3nA2oWVUvM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gz5esVDc0FQ1JqYzEQaQlSdvS8ag82NidTntrgDKm4d+Nm+4Uw/8lAV4jWz8yMa7jpZqgN5U2ilez/LDCRrHCKcDyx0R0kmOnh8wCqvwj6QNykADEQXZl6/RH47MSsY1bmNjp0/xPGIuhUvWMs5J4ksSRVT2mkR0+K9YSfBWozQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eKn0UBLP; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-33ddd1624beso1982730f8f.1
        for <linux-remoteproc@vger.kernel.org>; Sun, 31 Mar 2024 01:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711874765; x=1712479565; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ynnKTjrcpie+nYJ7zJCc1O/bqKJjh6+n6bK0J+8BU9g=;
        b=eKn0UBLPfWs3/FCQwlmpwniiztBjeVdAShWQwH6W9vnKYQk7grjxmt538jyg83x3zY
         E2R4a14910zg0WKlaFgrzZPIhkRamYkdGo14QN85dM3/bvic5jLaQlSkB2q78wEs9WOE
         3gWACJvKc0GBK6KJhoMTY4MD7wpNMd0Q8zyNh52h6zQ6JxrVFDZAVcAY8c5BXEPgKvcI
         gQxpO00Xf9K1AZdZ0jJwVfLskr0Z6xhf2xRF9tFbGOcub6Kur5rKsx5287ZiUrb62M4S
         Rbf7BvcP9t+NTnh4+jIWJLu8W3jxTvX1bfRCODKRJnmSb8JiD8BQNDIpgI5n4pKuiET2
         1bmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711874765; x=1712479565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ynnKTjrcpie+nYJ7zJCc1O/bqKJjh6+n6bK0J+8BU9g=;
        b=VrVEFM/GIM7CX8rCmH1CwSkzYyolJz8fXn/kthLaLhsaJvAhuFHozMHzIElFlxND26
         mg9puOPRUSZ9LvG3dWRgO0MD0BTbbHMxzlOl/3opReGu/OOuu/enyGtknuU+vS/452mq
         uW78N0pRBc80nmoMapJXhKkqgiq6poCjsHHyGWCla68+1yJL5whv8Rt4VI/a94QOCX29
         3DAckXmabBOufR1YoeXLEyPqMrSwzD4imfLG9d3GbF6iNrvBJF88X0iMkI9A/bWwN3gU
         EipEeA0xZ1SOLJB401Moj1C7waij3loHPrefiFGZeRR79HPBFC0j/UtKFCDiPolsjePE
         arnw==
X-Forwarded-Encrypted: i=1; AJvYcCWdmPSaQHP3ag+/qsNR3oWiNweXcILdqr7YhMyb5EPOXMuHaamQ5ab4dzLKoA3fE5hYTkbVmdHfdB2itCWE2oXjdNOM+mJ+78XfDDPaOtY/HA==
X-Gm-Message-State: AOJu0YwkQ06Ngegelajl6hAY3agsQd6dnKH9YW+zjmI25gt7NM4M+1gD
	0GB2CS5Ie1oX1TKtpSG3yxkASq2bwIDT0tDqQ93lKN3VOn/JrLm4oKIJJ+/RWis=
X-Google-Smtp-Source: AGHT+IE9HCbYqXr10WjNVCL6+bCwlLWbV/NMZIwtw1PAsCjjTRvMs1pGxGA/oXfJxTVFO3HnB1qqrw==
X-Received: by 2002:a05:6000:18a1:b0:341:e1b1:a5b5 with SMTP id b1-20020a05600018a100b00341e1b1a5b5mr6504132wri.13.1711874764733;
        Sun, 31 Mar 2024 01:46:04 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id k17-20020adff5d1000000b00341b7388dafsm8436003wrp.77.2024.03.31.01.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 01:46:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 31 Mar 2024 10:44:08 +0200
Subject: [PATCH v2 21/25] nvdimm: virtio_pmem: drop owner assignment
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-module-owner-virtio-v2-21-98f04bfaf46a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=811;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=djiFy5u3KBh7sxz0UqH9tQzKO6FqFPG/J3nA2oWVUvM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCSJiCUA1oHxtanMlVDa3B0IS2vFZjLtjegvnB
 r2LktHu/TmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgkiYgAKCRDBN2bmhouD
 1+fCD/9rVUL5S9fAYP2Cn2joknxd9GcyxZ1ZcSysBEormmSyzUriEDIqirrsKi680bEbDylBOX9
 x2MmTBvkQvu/rIQaoQX/tKOG7I91b1Vbkk+M/NAsbbgnagkOSShnc3shFsc3rXApauvlxnO1qvb
 z8DY07D/WFV3/ayX9Pc0+PnpUDKtjympuX6u7ZHB4k6EwKFN2I+M+HiqBoPn3/ikV3qi8Pl5ABn
 dVmokdreeUGTxM3sQFHK02cmnhLTPk71xIHNooat+Oh5ZT6rcdAvm0AG4WFUisCpcckAFMO+cX6
 PQoSym3RhOSPNBuSGE69s0aBavxd4IuhZiI4o/Jw+0VdzvVble2tpHu+anv+0Glt6Ng5f1OPaYi
 CXmDxjyV03jkc2tlsgpIdfrBwo4k9U+5eOoACVeHWRlxa6eDLI8ViIyEzujQpnD8ueNX2Q8XFgl
 S2ARJ2DUcykXT3jv1xRLTcRYkjqbSrBQ4N13gZPLY2T8UnZrpAwIylFubiw1Ahd+W3KV1JUzxwL
 vUBVwDlontFEzLJVXp78UAxmuAChFTir9BJsAENfp8Sn6B+wzUxU1X5IwJrmDBoO/JvPuQAW3N1
 eQRSKA5Wuv0EaRhEEMBePFtrM57giBzRXdSf97ZWQDn40PWYCC+66dK7kdUzInryIhsEEMdcmlc
 cYX7/PO50bomQrA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

virtio core already sets the .owner, so driver does not need to.

Acked-by: Dave Jiang <dave.jiang@intel.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Depends on the first patch.
---
 drivers/nvdimm/virtio_pmem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/nvdimm/virtio_pmem.c b/drivers/nvdimm/virtio_pmem.c
index 4ceced5cefcf..c9b97aeabf85 100644
--- a/drivers/nvdimm/virtio_pmem.c
+++ b/drivers/nvdimm/virtio_pmem.c
@@ -151,7 +151,6 @@ static struct virtio_driver virtio_pmem_driver = {
 	.feature_table		= features,
 	.feature_table_size	= ARRAY_SIZE(features),
 	.driver.name		= KBUILD_MODNAME,
-	.driver.owner		= THIS_MODULE,
 	.id_table		= id_table,
 	.validate		= virtio_pmem_validate,
 	.probe			= virtio_pmem_probe,

-- 
2.34.1


