Return-Path: <linux-remoteproc+bounces-923-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 296B988E5BA
	for <lists+linux-remoteproc@lfdr.de>; Wed, 27 Mar 2024 15:26:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC0AA1F2FFE8
	for <lists+linux-remoteproc@lfdr.de>; Wed, 27 Mar 2024 14:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC1701C1337;
	Wed, 27 Mar 2024 12:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bp653K+R"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A81D1509B9
	for <linux-remoteproc@vger.kernel.org>; Wed, 27 Mar 2024 12:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711543594; cv=none; b=Pe85UfiaSBJihc1KzOQt4ZkeQkqpVD8OgkMF8xYC442XoQQw2hNRzuyHIHe5j1MFl1bPFd/W1GGiJHc8ocLpE7QXodbkzUZ5U9CkXTxahud+cGRWHBb55Os1vBoIP7x4p3a/mWTE4pj7CkZ7RfBI5KkzHKsWgk1UJm2X4UQGMWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711543594; c=relaxed/simple;
	bh=NiQjVjMZFYqKExZsObNgm/DCszic+bAl+n8BqmPOZX4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hwH6c8nnBlIoxJFtUhJ7fAnrkEmRysjnSB4PTViifIt2u2oDWej2FgsVXpvu486I4Yb6kBg3zZTimfDZRR47qGV9sPWwrMrv1ln8LFgFu1C7HcIeVuRNC6Y79EvncTCtmxHN4h08VRtL+3xg4m/hFfHNHAbNim6hBcrvYcre8L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bp653K+R; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a467d8efe78so802335866b.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 27 Mar 2024 05:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711543591; x=1712148391; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CAdnlTchQh8FlREm+ioloxT9FS6Bj5xt9o2Hrx59/ek=;
        b=Bp653K+Rn8/iKglnUWa6T9WJpFFyL7BJWCG1/jj5aGR2E6kkf0JRG5cIMVS4gSuG53
         RXvZGOpxSjeavke6ey7AAJCb9QMJkWPvdCb/cM+CFLXKILRwBaYx8WTBlh0DgQBQ7k5P
         JoC3ttMpWEqVnFec9S+t6WCl+iC06GzIaZiXk77rN5BqokBaqWsnR2xYPSVD+hdeo7mU
         9CotXiG5r2yadOi2xLea+8egijmVS463uq22QI5g8kVD3xkXdNLjerk6nyL45Uam91rW
         JdI1YcV3BHa0L7shxuoZqStnGzHVbgsdCnoI4IerBxdd6f0C40OX9D+iTRqBZwUc1/eF
         U74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711543591; x=1712148391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CAdnlTchQh8FlREm+ioloxT9FS6Bj5xt9o2Hrx59/ek=;
        b=Dzl/4+upMcXeyUwgHdLHMtdrnKqm32s75KnXxhk1C2JmrzBb9bUXWPKRg23NeBEcLm
         5v7hg6x82GSoxMl6e7vh1N7/cA59RJDr3/4Fl2AUjYS5waCynXuYtqArHiKh84gFVhB2
         KFrtQ9qTSjQAyL3OgTAeQb5xM3P0esOb++RFKByjuWfRrmmltH65q+LfjWKbuDDXamvN
         zEeOgs2WuFwEuwt/aSsI0cAt5xVDclryl28J/7MHrMJ/4YZ2GhaCxQKUx1hpvwbiyCiY
         ub3pumeiOSZonyhzs45ZLiNRWqW6j+Z/qQivvEFH9J6RWjBlK3GZ8ykt34nrkhVI5YMc
         ArGg==
X-Forwarded-Encrypted: i=1; AJvYcCUE9yBZwTcktgBI52LRcvZsX+kZllH5M+yvVv7+yH9OdmfTW/YaGcqcrSRplSPH7IVfbph6SgFha/+rdNyr23nfPF+oJaSeoBTyuBtehspvhw==
X-Gm-Message-State: AOJu0YzMVwnrOksBVS+34hFROSsxYZasT/cUQ1w6WBVoVDu08bGf41dH
	g2crilVoALVwcOgEY9rIEfhitbnMRJMfDY4O4ZlrbUmeYOm2lYhUvWhe0FCoMdk=
X-Google-Smtp-Source: AGHT+IHVexc2kbCUunNAztPCJwdU2CYnVCIBBNG4v/92F/JNV3MM0F/SD/YxnW9+Oek5jxzlrpSwlg==
X-Received: by 2002:a17:906:411b:b0:a45:94bf:18e6 with SMTP id j27-20020a170906411b00b00a4594bf18e6mr908668ejk.73.1711543590897;
        Wed, 27 Mar 2024 05:46:30 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id gx16-20020a170906f1d000b00a4707ec7c34sm5379175ejb.166.2024.03.27.05.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 05:46:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 13:41:10 +0100
Subject: [PATCH 17/22] wireless: mac80211_hwsim: drop owner assignment
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-virtio-v1-17-0feffab77d99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=807;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=NiQjVjMZFYqKExZsObNgm/DCszic+bAl+n8BqmPOZX4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBBPo9EUYxSk0xH5wVhPIu64wDaxPpeXtcUWD2
 6lVJMlVdRuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgQT6AAKCRDBN2bmhouD
 18pcD/9PLz7we290JB+0IIbADnjysV/3BADPsYqLnSwRZ4yb6P+wx41774nzlWugyWHJCX/j/Qk
 f+VNbcHKb1Lk8fXjgCCChiCYTBGnw5m0bpt+moBBHgE52CQ1Sw1WVjxr0tM525MyMYRhjhTDkfS
 kYK9PvEwCSBa/xhbwmcPEP6UCxmFXDMSPWB4utZ9Fc3QDnFca25zSRK/P1Xo3dHciiN6rf1IC9I
 jwQsgm8oEV40ThwOHxYN1YewOL/FD/X/mJgSZgJiWLBv1xnab4CS4BB6TAR507GDgMyASK76u0k
 Xx6KkPwpj+sPF+Qjz2EtV9ace5CEDfSQVRNDJNIcfkAvG9L6sEtTiiv7moMhIsgem25GeUPAH5P
 gVKYvaK9WZSveQjPc0rldRRiwmPYY9+q2qmDZPnI1qkd9Sw/aN8dvngQ2Lf0IIiV9LMwDRXfNaW
 06OmPJupRIH4tcBbWGCnbw06+oKJtRRLsaQsVwuWUuzKkkq63vHWnKHgNWziYufFjtfGqteyaxF
 Cyx/H6WNuU8GKMM5SVtD9O2m5Tu77YKhw7llT2eX1nAn0aWiH8ZPBCgVFFpuC0qECvOGYFRNx4N
 n3uKKbezBh5kkdYwgPZ5FoHNa/MFZoeUGMRLBiWFJhEUW8yIKmy9W+cC+jLtG6Vmac2xysrgU/Z
 8y6mEAPjW44Ba+w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

virtio core already sets the .owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first patch.
---
 drivers/net/wireless/virtual/mac80211_hwsim.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/virtual/mac80211_hwsim.c b/drivers/net/wireless/virtual/mac80211_hwsim.c
index b55fe320633c..ef38b7cc9fdf 100644
--- a/drivers/net/wireless/virtual/mac80211_hwsim.c
+++ b/drivers/net/wireless/virtual/mac80211_hwsim.c
@@ -6662,7 +6662,6 @@ MODULE_DEVICE_TABLE(virtio, id_table);
 
 static struct virtio_driver virtio_hwsim = {
 	.driver.name = KBUILD_MODNAME,
-	.driver.owner = THIS_MODULE,
 	.id_table = id_table,
 	.probe = hwsim_virtio_probe,
 	.remove = hwsim_virtio_remove,

-- 
2.34.1


