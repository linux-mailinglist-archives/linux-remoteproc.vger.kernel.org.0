Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EAF92B404B
	for <lists+linux-remoteproc@lfdr.de>; Mon, 16 Nov 2020 10:54:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728597AbgKPJwA (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 16 Nov 2020 04:52:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58205 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728586AbgKPJv7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 16 Nov 2020 04:51:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1605520318;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1KNmLbHx5FsMWeQyHC4U7PBaTOGh9+m1vfmK/puBcB8=;
        b=VPp8MQBfkLba7UtdFuDVWYlwCp1h5Brdg0+JYl/D4BPpvIIIo0OqdDC9uo9jd7HXVYur5O
        p89Uw6I8vx0UHoXrjw3I1d3MiQHqtZiAvAX6+Vh8gSxuBYhwilXvTNank/JDfgvNGEoJ3H
        1MPxD2sIsF3uIBMs2yDKZc3xQOHTL2A=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-PPJWN4qWP2W1DOLksYzUlg-1; Mon, 16 Nov 2020 04:51:55 -0500
X-MC-Unique: PPJWN4qWP2W1DOLksYzUlg-1
Received: by mail-wr1-f70.google.com with SMTP id w5so8703937wrm.22
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2020 01:51:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1KNmLbHx5FsMWeQyHC4U7PBaTOGh9+m1vfmK/puBcB8=;
        b=UYpmXWlKjOJpUg/e0PKjMZSMCGH3RwEABzRiRhvCnaVG8lVo/MDQqktNAS7aozz28I
         scLKhn1fe+TVJaMom/sTgi+clgPygrsZJA0uWucdFE321GeogrcXWhB7wVsEuq5DnMMV
         OlKJYvefcgAkzytycXtUYrURt+sewZF7Fh4P6nZqezUXvazs4xgLq3jmeZb5wtWIF02l
         eSmhMntsavQWNo8LwawDxky2ox+N6lnNZIWok3pOqAwvLPGYu9O5J3DWVUoiap4ch8Vk
         f+PVVuZrNMXygCabgXGxRZPB9BitTbWiHqKbMoEiPZXh5Hnoxu4wR/Nq6ppIC7TeVd/H
         7t/Q==
X-Gm-Message-State: AOAM533RHT644W0d268AwmUZx1U0e3aXAQLAim0qv5jjye2YD0tM0fkt
        1mZZHP/yfcG4cgPg9Y7DqwkSLQnRb7TsoHKzFstUXaxoFhFRBPP7gM5eI7CSK9oPqLvnlyexQJT
        bZFIHLmdtDNFx9bblddLFMMM60SyV8g==
X-Received: by 2002:a5d:4046:: with SMTP id w6mr17917577wrp.51.1605520313881;
        Mon, 16 Nov 2020 01:51:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy5W14m0wF60uDdLzrkjrK5PsnrgSpm7lIZwz39JWVlPNEmIAhEgzigORtf8B6aoS6/Wf5jEQ==
X-Received: by 2002:a5d:4046:: with SMTP id w6mr17917548wrp.51.1605520313646;
        Mon, 16 Nov 2020 01:51:53 -0800 (PST)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
        by smtp.gmail.com with ESMTPSA id j8sm18304039wrx.11.2020.11.16.01.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 01:51:52 -0800 (PST)
Date:   Mon, 16 Nov 2020 04:51:49 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Alexander Lobakin <alobakin@pm.me>, Amit Shah <amit@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Suman Anna <s-anna@ti.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Jason Wang <jasowang@redhat.com>,
        virtualization@lists.linux-foundation.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH virtio] virtio: virtio_console: fix DMA memory allocation
 for rproc serial
Message-ID: <20201116045127-mutt-send-email-mst@kernel.org>
References: <AOKowLclCbOCKxyiJ71WeNyuAAj2q8EUtxrXbyky5E@cp7-web-042.plabs.ch>
 <20201116091950.GA30524@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201116091950.GA30524@infradead.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Nov 16, 2020 at 09:19:50AM +0000, Christoph Hellwig wrote:
> I just noticed this showing up in Linus' tree and I'm not happy.
> 
> This whole model of the DMA subdevices in remoteproc is simply broken.
> 
> We really need to change the virtio code pass an expicit DMA device (
> similar to what e.g. the USB and RDMA code does),

Could you point me at an example or two please?

Thanks!

> instead of faking up
> devices with broken adhoc inheritance of DMA properties and magic poking
> into device parent relationships.
> 
> Bjorn, I thought you were going to look into this a while ago?
> 
> 
> On Wed, Nov 04, 2020 at 03:31:36PM +0000, Alexander Lobakin wrote:
> > Since commit 086d08725d34 ("remoteproc: create vdev subdevice with
> > specific dma memory pool"), every remoteproc has a DMA subdevice
> > ("remoteprocX#vdevYbuffer") for each virtio device, which inherits
> > DMA capabilities from the corresponding platform device. This allowed
> > to associate different DMA pools with each vdev, and required from
> > virtio drivers to perform DMA operations with the parent device
> > (vdev->dev.parent) instead of grandparent (vdev->dev.parent->parent).
> > 
> > virtio_rpmsg_bus was already changed in the same merge cycle with
> > commit d999b622fcfb ("rpmsg: virtio: allocate buffer from parent"),
> > but virtio_console did not. In fact, operations using the grandparent
> > worked fine while the grandparent was the platform device, but since
> > commit c774ad010873 ("remoteproc: Fix and restore the parenting
> > hierarchy for vdev") this was changed, and now the grandparent device
> > is the remoteproc device without any DMA capabilities.
> > So, starting v5.8-rc1 the following warning is observed:
> > 
> > [    2.483925] ------------[ cut here ]------------
> > [    2.489148] WARNING: CPU: 3 PID: 101 at kernel/dma/mapping.c:427 0x80e7eee8
> > [    2.489152] Modules linked in: virtio_console(+)
> > [    2.503737]  virtio_rpmsg_bus rpmsg_core
> > [    2.508903]
> > [    2.528898] <Other modules, stack and call trace here>
> > [    2.913043]
> > [    2.914907] ---[ end trace 93ac8746beab612c ]---
> > [    2.920102] virtio-ports vport1p0: Error allocating inbufs
> > 
> > kernel/dma/mapping.c:427 is:
> > 
> > WARN_ON_ONCE(!dev->coherent_dma_mask);
> > 
> > obviously because the grandparent now is remoteproc dev without any
> > DMA caps:
> > 
> > [    3.104943] Parent: remoteproc0#vdev1buffer, grandparent: remoteproc0
> > 
> > Fix this the same way as it was for virtio_rpmsg_bus, using just the
> > parent device (vdev->dev.parent, "remoteprocX#vdevYbuffer") for DMA
> > operations.
> > This also allows now to reserve DMA pools/buffers for rproc serial
> > via Device Tree.
> > 
> > Fixes: c774ad010873 ("remoteproc: Fix and restore the parenting hierarchy for vdev")
> > Cc: stable@vger.kernel.org # 5.1+
> > Signed-off-by: Alexander Lobakin <alobakin@pm.me>
> > ---
> >  drivers/char/virtio_console.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/char/virtio_console.c b/drivers/char/virtio_console.c
> > index a2da8f768b94..1836cc56e357 100644
> > --- a/drivers/char/virtio_console.c
> > +++ b/drivers/char/virtio_console.c
> > @@ -435,12 +435,12 @@ static struct port_buffer *alloc_buf(struct virtio_device *vdev, size_t buf_size
> >  		/*
> >  		 * Allocate DMA memory from ancestor. When a virtio
> >  		 * device is created by remoteproc, the DMA memory is
> > -		 * associated with the grandparent device:
> > -		 * vdev => rproc => platform-dev.
> > +		 * associated with the parent device:
> > +		 * virtioY => remoteprocX#vdevYbuffer.
> >  		 */
> > -		if (!vdev->dev.parent || !vdev->dev.parent->parent)
> > +		buf->dev = vdev->dev.parent;
> > +		if (!buf->dev)
> >  			goto free_buf;
> > -		buf->dev = vdev->dev.parent->parent;
> >  
> >  		/* Increase device refcnt to avoid freeing it */
> >  		get_device(buf->dev);
> > -- 
> > 2.29.2
> > 
> > 
> ---end quoted text---

