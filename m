Return-Path: <linux-remoteproc+bounces-765-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F7D87B6B8
	for <lists+linux-remoteproc@lfdr.de>; Thu, 14 Mar 2024 04:12:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF2692823E6
	for <lists+linux-remoteproc@lfdr.de>; Thu, 14 Mar 2024 03:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4D074A15;
	Thu, 14 Mar 2024 03:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VhjAEB1U"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178801A38D8
	for <linux-remoteproc@vger.kernel.org>; Thu, 14 Mar 2024 03:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710385961; cv=none; b=h24q5QAK0ibDu3SkdC5Hc9MrYoiENwhpyhWcQneNJkQeHq6ySr9Mf9khkQDB4MQkTRqB3pkQiMGoXUwjX4Wu8bqYyjcOdPJw9cr9IdVGNyUoKbowDBv3Fa9aHg/YF32Nuevyi+404PeT5s33EpH0e21rkE3HulP1OyOwnxxwXbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710385961; c=relaxed/simple;
	bh=bXjlov1+xgNpyNB5/H0sUGt9aauzEi+JWNlLMri0PVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pgnxqUeLUljLALnGZM3OfEbCVKH9bmBd4n2hOB5Cb8t8Q8ethkDSgseghh6/LDPIO2kbsjN/+y2yv29fiB/qq7h3ZCSng0hgxoXUGVYlhPlhHjyNuL5l3KDQzDINZTiqjpMfZGK3br+jeoEUTZe12nPwOsK1tor+nUrqbvQiGyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VhjAEB1U; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710385959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ujVLStF8fNwjZHlFP85Jc/cq8HmkRWbLvyNFVb8jE2E=;
	b=VhjAEB1UhlV6ugFjGWTMxi26Fzea/S9sDgnBENrbr56pzfAOzW2E8kJXP3G2uMtBkLPLWV
	S/bkeh1trPydBzn8vIrQ2+7Tb+oFwewSlTZY4bPBDPTHCTPpMrFRX1+qXLc+TLRQUYXdhO
	ZCZcvvtc6IEnonHpenGkzXqB+HzEhTI=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-474-gDIkKgmNP3uBKT-2Gb6s4A-1; Wed, 13 Mar 2024 23:12:37 -0400
X-MC-Unique: gDIkKgmNP3uBKT-2Gb6s4A-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-29b9babb547so526670a91.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 Mar 2024 20:12:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710385955; x=1710990755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ujVLStF8fNwjZHlFP85Jc/cq8HmkRWbLvyNFVb8jE2E=;
        b=aNnREvkqfm+JkXtsxWApdycRu/T+rxzsyewTSxwkbkIn6HpevCCFz7Uh9fDJwk2+CB
         MIgsaQkYmQSqxPF9+fnPNf1ANKrAzj0LzbONEs/w9tHrEzjQwXOOdSu/2bzo6CLPx+/3
         3V9e9MJx7fQIT+zDE9X4m92S2x1YA6/pJZbsAe0Avw6CtLu3TykCe7x5XeQ/OkTbCfgu
         HK+liSGsNQF/8XCTA0CpOhLlQMf2C/TCqzUY/5ogw/mJ8f2KITIKALJ1mSr6P3NLv6P2
         KSW2LAhiH9ka+gAzTHKH7J7FVPC2+R/IwrTuonwcjhsq5pRo2Sei2UiNxRA0UgJDNiYZ
         jQGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVprgRy8WVpLnrybgZ1V29RH04cJLt8kPkIwT6eI6IrzBkkzqwZc33V9xIkEPMXfP3rkZsAP30x94vmeNRQUJjWw2vBn4UfEwOS002CHDDXcQ==
X-Gm-Message-State: AOJu0YxIZnoh1AnXVPb4X5F5c4WNDLhe0Mqxqf+Vs5C9rBOiuMFLWeMM
	Vk2PtjBMl3ch5+hjFOv0G3JZJ8cF2ZvpzU57/QGeT4F5h5ry21lsMXSDz4+G4lwlRbHUfzfX7P/
	5d6ylzue4l68wSHDJD+S7Un29vRc3KLe9mwRmStNA1NaX/OzuwqB183K3BlOdww0H99JqJkdmmw
	PrIJCvjN8WwqEFtJIFRWDtxJwLAD4Pk5lIj4Bflksz1gFCtVy7mQ==
X-Received: by 2002:a17:90b:1115:b0:29b:dc5c:d534 with SMTP id gi21-20020a17090b111500b0029bdc5cd534mr556804pjb.29.1710385955621;
        Wed, 13 Mar 2024 20:12:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgnFIYDkamcOx1cys2VlJt8HrQE2eq5Dv8Fg1l35A9jQKw+iznC+SY6FdtZSdCDKBufcIfbsUlkHcDHjjBuKE=
X-Received: by 2002:a17:90b:1115:b0:29b:dc5c:d534 with SMTP id
 gi21-20020a17090b111500b0029bdc5cd534mr556779pjb.29.1710385955375; Wed, 13
 Mar 2024 20:12:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240312021013.88656-1-xuanzhuo@linux.alibaba.com> <20240312021013.88656-2-xuanzhuo@linux.alibaba.com>
In-Reply-To: <20240312021013.88656-2-xuanzhuo@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 14 Mar 2024 11:12:24 +0800
Message-ID: <CACGkMEvVgfgAxLoKeFTgy-1GR0W07ciPYFuqs6PiWtKCnXuWTw@mail.gmail.com>
Subject: Re: [PATCH vhost v3 1/4] virtio: find_vqs: pass struct instead of
 multi parameters
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: virtualization@lists.linux.dev, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Vadim Pasternak <vadimp@nvidia.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Cornelia Huck <cohuck@redhat.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>, linux-um@lists.infradead.org, 
	platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-s390@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 12, 2024 at 10:10=E2=80=AFAM Xuan Zhuo <xuanzhuo@linux.alibaba.=
com> wrote:
>
> Now, we pass multi parameters to find_vqs. These parameters
> may work for transport or work for vring.
>
> And find_vqs has multi implements in many places:
>
>  arch/um/drivers/virtio_uml.c
>  drivers/platform/mellanox/mlxbf-tmfifo.c
>  drivers/remoteproc/remoteproc_virtio.c
>  drivers/s390/virtio/virtio_ccw.c
>  drivers/virtio/virtio_mmio.c
>  drivers/virtio/virtio_pci_legacy.c
>  drivers/virtio/virtio_pci_modern.c
>  drivers/virtio/virtio_vdpa.c
>
> Every time, we try to add a new parameter, that is difficult.
> We must change every find_vqs implement.
>
> One the other side, if we want to pass a parameter to vring,
> we must change the call path from transport to vring.
> Too many functions need to be changed.
>
> So it is time to refactor the find_vqs. We pass a structure
> cfg to find_vqs(), that will be passed to vring by transport.
>
> Because the vp_modern_create_avq() use the "const char *names[]",
> and the virtio_uml.c changes the name in the subsequent commit, so
> change the "names" inside the virtio_vq_config from "const char *const
> *names" to "const char **names".
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> Acked-by: Johannes Berg <johannes@sipsolutions.net>
> Reviewed-by: Ilpo J=3DE4rvinen <ilpo.jarvinen@linux.intel.com>

The name seems broken here.

[...]

>
>  typedef void vq_callback_t(struct virtqueue *);
>
> +/**
> + * struct virtio_vq_config - configure for find_vqs()
> + * @cfg_idx: Used by virtio core. The drivers should set this to 0.
> + *     During the initialization of each vq(vring setup), we need to kno=
w which
> + *     item in the array should be used at that time. But since the item=
 in
> + *     names can be null, which causes some item of array to be skipped,=
 we
> + *     cannot use vq.index as the current id. So add a cfg_idx to let vr=
ing
> + *     know how to get the current configuration from the array when
> + *     initializing vq.

So this design is not good. If it is not something that the driver
needs to care about, the core needs to hide it from the API.

Thanks


