Return-Path: <linux-remoteproc+bounces-965-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1AD891804
	for <lists+linux-remoteproc@lfdr.de>; Fri, 29 Mar 2024 12:42:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C5662864BA
	for <lists+linux-remoteproc@lfdr.de>; Fri, 29 Mar 2024 11:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1C117E0EB;
	Fri, 29 Mar 2024 11:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XLABrnXR"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664766A8A3
	for <linux-remoteproc@vger.kernel.org>; Fri, 29 Mar 2024 11:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711712543; cv=none; b=Y/btLomClF+qBPsP9X7MYprhCfTvvHeCJZR4cOw89PaCZJkpXWtWUo16g4rGFtAHY2vk6DBESrZIuSXWSvMVTAYhNSA2Xbu567dg+LEglRTfzfTp8w7Od33xM1fPvyXIxdpy5tB5UzErBA9+aJwMN0QSH5iX8BeQWKaPVu/cU68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711712543; c=relaxed/simple;
	bh=CnPyW/y5UQrILS7vE5ScOzPk56jpnW7Bki+iQBNgkGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H5tfvWx7d/sYMQ668rYw2WZ4cAxUSrbBqho5PaH8dVb8qu+JkL8EquFHtms8ngS6s8Mmh/jFjtsSwgWXoqAKYvHpfo+Cn92GwXgaoVyjB6hmUvx4JSkaOtPIDCmvsbEYkoF61tIFKaMnM1QTdtfyH2dA4FmAhcTkBPbHc1s2ODE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XLABrnXR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711712538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+BsDTTyNU5pgUTxWeniUBybyV1pHa+zj3gLQFOaKcJw=;
	b=XLABrnXRSolT0vceLyGVBE+H8tmnoJucjQkXgGm5dGhzmbe0PHjzXWegDjl/dH3F52wgXz
	s8P7CvQ2OgvHo91ewidlrjPVmcPOzvQX8CAx6c5AXRIR1IZRRX9HJLW8VmgjV/yoNiVKKq
	kc7vZTvsGb8cj5DOiQE3wPulhCNzZLw=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509-1o7w6qheO-uCWE_OQhpQaw-1; Fri, 29 Mar 2024 07:42:16 -0400
X-MC-Unique: 1o7w6qheO-uCWE_OQhpQaw-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2d6b9530792so16527571fa.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 29 Mar 2024 04:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711712535; x=1712317335;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+BsDTTyNU5pgUTxWeniUBybyV1pHa+zj3gLQFOaKcJw=;
        b=COgzVf+vQfvcgDhk0f+g6Qm0yiRAxwGuXQMEePvqPF8Nh6FtZd8JDc4ygCykRVkTS0
         rpFxGfzm3t+4ekddCyKkGtSPkJ0pUCTwh9DtGbd1uWR1NuECS6SGtkYauO17zFdAYbym
         LdK894Vqb3x5Kxl6W7cANIsEQCJbv7knWWPzqlaRgS3I8yV0wdSRfi8R1ZNjPsf2606r
         bTp86A4aKInPVs73QrAWeL1ChmUj8p+85jfNjWO2Y21lRn8ps+cnnF03P65EYY6ZNqqk
         RXkH7EEg4aI8w9Z5IaXO0h6i56Y3Fwtct05D78MlIWz/4DEo2toHwuciKHaabr1svfsf
         jNTA==
X-Forwarded-Encrypted: i=1; AJvYcCVNW6HOwE1jh69gb/VNk0v/k34n1RmmJzhBDQ6wFTnc1ihyPnjjoMmzGFAnUXNW24Vh4HeWve3UFcyoTocNqbe2SZBZBSXa3qb5EHslHhbeqQ==
X-Gm-Message-State: AOJu0YzmNbWMEtpU/Evpq3+YxwB7e+g1hQA0qcDE69y49xgr2tAdd+cn
	5zmNPxuHcC2z9+SjhpzSREHZHWximqoaMf5IswayLEuhnB/GTp3YEMiUGbMVRRn3hItCL7hX03c
	DVF8iuqY851z5yNSOuy48AqljN698JtvtwGgVGbp9BGobYkm8nVJscFRvCVEcQKY9rqI=
X-Received: by 2002:a2e:9659:0:b0:2d6:e148:2463 with SMTP id z25-20020a2e9659000000b002d6e1482463mr1428752ljh.24.1711712535154;
        Fri, 29 Mar 2024 04:42:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEACBjwkvqDUtHOsu+pH/smraarLJWyQq+BtaLZf+sEYEs2CGiOj/cy+sTyYbp3cXHSv/vHng==
X-Received: by 2002:a2e:9659:0:b0:2d6:e148:2463 with SMTP id z25-20020a2e9659000000b002d6e1482463mr1428676ljh.24.1711712534737;
        Fri, 29 Mar 2024 04:42:14 -0700 (PDT)
Received: from sgarzare-redhat (host-87-12-25-33.business.telecomitalia.it. [87.12.25.33])
        by smtp.gmail.com with ESMTPSA id s7-20020a1709062ec700b00a46abaeeb1csm1837128eji.104.2024.03.29.04.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 04:42:14 -0700 (PDT)
Date: Fri, 29 Mar 2024 12:42:08 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Paolo Bonzini <pbonzini@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Jens Axboe <axboe@kernel.dk>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Amit Shah <amit@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Gonglei <arei.gonglei@huawei.com>, 
	"David S. Miller" <davem@davemloft.net>, Viresh Kumar <vireshk@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, Joerg Roedel <joro@8bytes.org>, Alexander Graf <graf@amazon.com>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Eric Van Hensbergen <ericvh@kernel.org>, 
	Latchesar Ionkov <lucho@ionkov.net>, Dominique Martinet <asmadeus@codewreck.org>, 
	Christian Schoenebeck <linux_oss@crudebyte.com>, Kalle Valo <kvalo@kernel.org>, 
	Dan Williams <dan.j.williams@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Vivek Goyal <vgoyal@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>, 
	Anton Yakovlev <anton.yakovlev@opensynergy.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	virtualization@lists.linux.dev, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, iommu@lists.linux.dev, netdev@vger.kernel.org, 
	v9fs@lists.linux.dev, kvm@vger.kernel.org, linux-wireless@vger.kernel.org, 
	nvdimm@lists.linux.dev, linux-remoteproc@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 01/22] virtio: store owner from modules with
 register_virtio_driver()
Message-ID: <oaoiehcpkjs3wrhc22pwx676pompxml2z5dcq32a6fvsyntonw@hnohrbbp6wpm>
References: <20240327-module-owner-virtio-v1-0-0feffab77d99@linaro.org>
 <20240327-module-owner-virtio-v1-1-0feffab77d99@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20240327-module-owner-virtio-v1-1-0feffab77d99@linaro.org>

On Wed, Mar 27, 2024 at 01:40:54PM +0100, Krzysztof Kozlowski wrote:
>Modules registering driver with register_virtio_driver() might forget to
>set .owner field.  i2c-virtio.c for example has it missing.  The field
>is used by some of other kernel parts for reference counting
>(try_module_get()), so it is expected that drivers will set it.
>
>Solve the problem by moving this task away from the drivers to the core
>amba bus code, just like we did for platform_driver in
>commit 9447057eaff8 ("platform_device: use a macro instead of
>platform_driver_register").
>
>Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>---
> Documentation/driver-api/virtio/writing_virtio_drivers.rst | 1 -
> drivers/virtio/virtio.c                                    | 6 ++++--
> include/linux/virtio.h                                     | 7 +++++--
> 3 files changed, 9 insertions(+), 5 deletions(-)
>
>diff --git a/Documentation/driver-api/virtio/writing_virtio_drivers.rst b/Documentation/driver-api/virtio/writing_virtio_drivers.rst
>index e14c58796d25..e5de6f5d061a 100644
>--- a/Documentation/driver-api/virtio/writing_virtio_drivers.rst
>+++ b/Documentation/driver-api/virtio/writing_virtio_drivers.rst
>@@ -97,7 +97,6 @@ like this::
>
> 	static struct virtio_driver virtio_dummy_driver = {
> 		.driver.name =  KBUILD_MODNAME,
>-		.driver.owner = THIS_MODULE,
> 		.id_table =     id_table,
> 		.probe =        virtio_dummy_probe,
> 		.remove =       virtio_dummy_remove,
>diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
>index f173587893cb..9510c551dce8 100644
>--- a/drivers/virtio/virtio.c
>+++ b/drivers/virtio/virtio.c
>@@ -362,14 +362,16 @@ static const struct bus_type virtio_bus = {
> 	.remove = virtio_dev_remove,
> };
>
>-int register_virtio_driver(struct virtio_driver *driver)
>+int __register_virtio_driver(struct virtio_driver *driver, struct module *owner)
> {
> 	/* Catch this early. */
> 	BUG_ON(driver->feature_table_size && !driver->feature_table);
> 	driver->driver.bus = &virtio_bus;
>+	driver->driver.owner = owner;
>+

`.driver.name =  KBUILD_MODNAME` also seems very common, should we put
that in the macro as well?

> 	return driver_register(&driver->driver);
> }
>-EXPORT_SYMBOL_GPL(register_virtio_driver);
>+EXPORT_SYMBOL_GPL(__register_virtio_driver);
>
> void unregister_virtio_driver(struct virtio_driver *driver)
> {
>diff --git a/include/linux/virtio.h b/include/linux/virtio.h
>index b0201747a263..26c4325aa373 100644
>--- a/include/linux/virtio.h
>+++ b/include/linux/virtio.h
>@@ -170,7 +170,7 @@ size_t virtio_max_dma_size(const struct virtio_device *vdev);
>
> /**
>  * struct virtio_driver - operations for a virtio I/O driver
>- * @driver: underlying device driver (populate name and owner).
>+ * @driver: underlying device driver (populate name).
>  * @id_table: the ids serviced by this driver.
>  * @feature_table: an array of feature numbers supported by this driver.
>  * @feature_table_size: number of entries in the feature table array.
>@@ -208,7 +208,10 @@ static inline struct virtio_driver *drv_to_virtio(struct device_driver *drv)
> 	return container_of(drv, struct virtio_driver, driver);
> }
>
>-int register_virtio_driver(struct virtio_driver *drv);
>+/* use a macro to avoid include chaining to get THIS_MODULE */
>+#define register_virtio_driver(drv) \
>+	__register_virtio_driver(drv, THIS_MODULE)
>+int __register_virtio_driver(struct virtio_driver *drv, struct module *owner);
> void unregister_virtio_driver(struct virtio_driver *drv);
>
> /* module_virtio_driver() - Helper macro for drivers that don't do
>
>-- 
>2.34.1
>


