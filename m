Return-Path: <linux-remoteproc+bounces-364-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 627A7843ACF
	for <lists+linux-remoteproc@lfdr.de>; Wed, 31 Jan 2024 10:17:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F07CB2C8F2
	for <lists+linux-remoteproc@lfdr.de>; Wed, 31 Jan 2024 09:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BBDB73168;
	Wed, 31 Jan 2024 09:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AeZbFp3x"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EC66EB65
	for <linux-remoteproc@vger.kernel.org>; Wed, 31 Jan 2024 09:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706692360; cv=none; b=a/JUEihp0CtYrdXUjRzZTZMlgOgMXicGLcN80cqQHqmZdNDNHfLp8bOue/5H/nc9cXje6L9TLU0cQrmiVRTa9TuS/qyQufr8CX3RYuuVHqrbsEgjDoxHNUfYf4kRBWWr0kQaJKLZkuTISosdUmP69J2Nby4TxVuFi10FSkqmp0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706692360; c=relaxed/simple;
	bh=1IbbNg9WzMSGILSE+bt6RMfdtxG4VCDjXqgD72H0ufY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LV73CKAJ0S2bwunRmcGYe8xSqDCKJtc1gQ/zt+LfQ9lWjE82NvsjjdI5Ilhldx+PnE0Y5lR82vwkS0KwAtgjj1bBUUUVV4q2aQbnaMFV+Ou4a5PiJAJITlxFhz+/hSC8VMSf3blXvXM8yQNgwMRV35wLFaRXDaD+UbxCaeHXXo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AeZbFp3x; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706692357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VJZkeylYKHHxcFFB0bIOJ/hK42jYe/laqdrK+DNO0NQ=;
	b=AeZbFp3x7aY9FXgjLZBQczg+6y5LIkg1/aI5m7s7annNtHcBGB+Hu17mDBeXbnHYX9OY8g
	rvWKr0p2ylcX4o56wzLmpiQ4Nh59uqbCmyTwsFVyUez3EG5t8drv3Rv88fCCrJ+Gd9j+2K
	C8jSvlaVzmTI+ShwctahbQ2BSLeQ/3w=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-57-T_aR8rGLPMCj5VGIGDwm4A-1; Wed, 31 Jan 2024 04:12:36 -0500
X-MC-Unique: T_aR8rGLPMCj5VGIGDwm4A-1
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3bea843272fso1267306b6e.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 31 Jan 2024 01:12:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706692355; x=1707297155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VJZkeylYKHHxcFFB0bIOJ/hK42jYe/laqdrK+DNO0NQ=;
        b=uBHqJu3OPHklw5lbiK62zlvdhZnFoWu1bacFYENIHJ13WsdAVnFm7lO/Ow1aJ8iVIa
         Cl1henkreh3dxb2wNigZ7aufXTnWWzbXDVsQTMKn8CBMyQ1jxr5SPOj38MOiRGsqAHSg
         QmTomx0VSmEskDo6UaQ6hYhQwc2Zw5lvrXtvyxmA9oeEbn5UN3v0Z/902XyYg3vdb82o
         3XQZ4zn/3kKSdyHMWreFtLwkCaYrqeBWgh1975bCh1FINrGDY6wopb3c7cJ9MCeIRz3z
         uq2rDM1BO6awseGJrHI9TNjRU8ZIYepPuvgeDR8Hkhuoa64Gjz7Lw9Z8JgaqyHsWcl+O
         Jfkw==
X-Gm-Message-State: AOJu0Yzaaga41cVGG+/1rNSgwyGybZuwbn4feDAvzu77g24ZFNe0I2do
	H4QB5PS7N+Jnxr+ayO2O1pUt79pQKALH2A6IdH+FAoIoSf84OVXjuf1eJqjcv9PzUAC9xmDbWUD
	i4PfupgvZIXZxx9cOneL6fIxSrQ13M0t4WANOmLV3jJR8AwXPXxdbH/GxdA1omEOLD+at2PKQ7g
	oGthHubHq3VflLeM3+EWh6GBW27c1eJK4bQzHjaM+bKQ==
X-Received: by 2002:a05:6808:10d0:b0:3be:b99e:c4b5 with SMTP id s16-20020a05680810d000b003beb99ec4b5mr1134520ois.49.1706692355426;
        Wed, 31 Jan 2024 01:12:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqf5XhmMZVc/mvQ+v/Dn0eccGIZhcIm1GbAvr8L9HK2CJQtaTuYKH+cdWn6A0p6FI4Vi12/FhvV3cS9wCPbWU=
X-Received: by 2002:a05:6808:10d0:b0:3be:b99e:c4b5 with SMTP id
 s16-20020a05680810d000b003beb99ec4b5mr1134482ois.49.1706692355156; Wed, 31
 Jan 2024 01:12:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130114224.86536-1-xuanzhuo@linux.alibaba.com> <20240130114224.86536-5-xuanzhuo@linux.alibaba.com>
In-Reply-To: <20240130114224.86536-5-xuanzhuo@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 31 Jan 2024 17:12:22 +0800
Message-ID: <CACGkMEs-wUa_z_tGYEwBf7EVJAtuJdkX4HAdjqMXHEM1ys-gKQ@mail.gmail.com>
Subject: Re: [PATCH vhost 04/17] virtio_ring: split: remove double check of
 the unmap ops
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: virtualization@lists.linux.dev, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	"Michael S. Tsirkin" <mst@redhat.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Vadim Pasternak <vadimp@nvidia.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Cornelia Huck <cohuck@redhat.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Benjamin Berg <benjamin.berg@intel.com>, 
	Yang Li <yang.lee@linux.alibaba.com>, linux-um@lists.infradead.org, 
	netdev@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, 
	kvm@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 7:42=E2=80=AFPM Xuan Zhuo <xuanzhuo@linux.alibaba.c=
om> wrote:
>
> In the functions vring_unmap_one_split and
> vring_unmap_one_split_indirect,
> multiple checks are made whether unmap is performed and whether it is
> INDIRECT.
>
> These two functions are usually called in a loop, and we should put the
> check outside the loop.
>
> And we unmap the descs with VRING_DESC_F_INDIRECT on the same path with
> other descs, that make the thing more complex. If we distinguish the
> descs with VRING_DESC_F_INDIRECT before unmap, thing will be clearer.
>
> 1. only one desc of the desc table is used, we do not need the loop
> 2. the called unmap api is difference from the other desc
> 3. the vq->premapped is not needed to check
> 4. the vq->indirect is not needed to check
> 5. the state->indir_desc must not be null
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>  drivers/virtio/virtio_ring.c | 80 ++++++++++++++++++------------------
>  1 file changed, 39 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index dd03bc5a81fe..2b41fdbce975 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -452,9 +452,6 @@ static void vring_unmap_one_split_indirect(const stru=
ct vring_virtqueue *vq,
>  {
>         u16 flags;
>
> -       if (!vring_need_unmap_buffer(vq))
> -               return;
> -
>         flags =3D virtio16_to_cpu(vq->vq.vdev, desc->flags);
>
>         dma_unmap_page(vring_dma_dev(vq),
> @@ -472,27 +469,12 @@ static unsigned int vring_unmap_one_split(const str=
uct vring_virtqueue *vq,
>
>         flags =3D extra[i].flags;
>
> -       if (flags & VRING_DESC_F_INDIRECT) {
> -               if (!vq->use_dma_api)
> -                       goto out;
> -
> -               dma_unmap_single(vring_dma_dev(vq),
> -                                extra[i].addr,
> -                                extra[i].len,
> -                                (flags & VRING_DESC_F_WRITE) ?
> -                                DMA_FROM_DEVICE : DMA_TO_DEVICE);
> -       } else {
> -               if (!vring_need_unmap_buffer(vq))
> -                       goto out;
> -
> -               dma_unmap_page(vring_dma_dev(vq),
> -                              extra[i].addr,
> -                              extra[i].len,
> -                              (flags & VRING_DESC_F_WRITE) ?
> -                              DMA_FROM_DEVICE : DMA_TO_DEVICE);
> -       }
> +       dma_unmap_page(vring_dma_dev(vq),
> +                      extra[i].addr,
> +                      extra[i].len,
> +                      (flags & VRING_DESC_F_WRITE) ?
> +                      DMA_FROM_DEVICE : DMA_TO_DEVICE);
>
> -out:
>         return extra[i].next;
>  }
>
> @@ -660,7 +642,7 @@ static inline int virtqueue_add_split(struct virtqueu=
e *_vq,
>                         vq, desc, total_sg * sizeof(struct vring_desc),
>                         DMA_TO_DEVICE);
>                 if (vring_mapping_error(vq, addr)) {
> -                       if (vq->premapped)
> +                       if (!vring_need_unmap_buffer(vq))
>                                 goto free_indirect;
>
>                         goto unmap_release;
> @@ -713,6 +695,9 @@ static inline int virtqueue_add_split(struct virtqueu=
e *_vq,
>         return 0;
>
>  unmap_release:
> +
> +       WARN_ON(!vring_need_unmap_buffer(vq));
> +
>         err_idx =3D i;
>
>         if (indirect)
> @@ -774,34 +759,42 @@ static void detach_buf_split(struct vring_virtqueue=
 *vq, unsigned int head,
>  {
>         unsigned int i, j;
>         __virtio16 nextflag =3D cpu_to_virtio16(vq->vq.vdev, VRING_DESC_F=
_NEXT);
> +       u16 flags;
>
>         /* Clear data ptr. */
>         vq->split.desc_state[head].data =3D NULL;
> +       flags =3D vq->split.desc_extra[head].flags;
>
>         /* Put back on free list: unmap first-level descriptors and find =
end */
>         i =3D head;
>
> -       while (vq->split.vring.desc[i].flags & nextflag) {
> -               vring_unmap_one_split(vq, i);
> -               i =3D vq->split.desc_extra[i].next;
> -               vq->vq.num_free++;
> -       }
> -
> -       vring_unmap_one_split(vq, i);
> -       vq->split.desc_extra[i].next =3D vq->free_head;
> -       vq->free_head =3D head;
> +       if (!(flags & VRING_DESC_F_INDIRECT)) {

So during add we do:

        if (!indirect && vring_need_unmap_buffer(vq))
                vq->split.desc_extra[prev & (vq->split.vring.num - 1)].flag=
s &=3D
                        ~VRING_DESC_F_NEXT;

Then using flags here unconditionally seems not reliable.

I post a patch to store flags unconditionally at:

https://lore.kernel.org/all/20220224122655-mutt-send-email-mst@kernel.org/

> +               while (vq->split.vring.desc[i].flags & nextflag) {
> +                       if (vring_need_unmap_buffer(vq))
> +                               vring_unmap_one_split(vq, i);
> +                       i =3D vq->split.desc_extra[i].next;
> +                       vq->vq.num_free++;
> +               }
>
> -       /* Plus final descriptor */
> -       vq->vq.num_free++;
> +               if (vring_need_unmap_buffer(vq))
> +                       vring_unmap_one_split(vq, i);
>
> -       if (vq->indirect) {
> +               if (ctx)
> +                       *ctx =3D vq->split.desc_state[head].indir_desc;
> +       } else {
>                 struct vring_desc *indir_desc =3D
>                                 vq->split.desc_state[head].indir_desc;
>                 u32 len;
>
> -               /* Free the indirect table, if any, now that it's unmappe=
d. */
> -               if (!indir_desc)
> -                       return;
> +               if (vq->use_dma_api) {
> +                       struct vring_desc_extra *extra =3D vq->split.desc=
_extra;
> +
> +                       dma_unmap_single(vring_dma_dev(vq),
> +                                        extra[i].addr,
> +                                        extra[i].len,
> +                                        (flags & VRING_DESC_F_WRITE) ?
> +                                        DMA_FROM_DEVICE : DMA_TO_DEVICE)=
;
> +               }

Note that there's a following

BUG_ON(!(vq->split.desc_extra[head].flags &
                                VRING_DESC_F_INDIRECT));

Which I think we can remove.

Thanks


