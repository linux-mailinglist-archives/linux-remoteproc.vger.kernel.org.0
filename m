Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE8A8564CA8
	for <lists+linux-remoteproc@lfdr.de>; Mon,  4 Jul 2022 06:36:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230228AbiGDEf4 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 4 Jul 2022 00:35:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbiGDEfz (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 4 Jul 2022 00:35:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5A8A55F57
        for <linux-remoteproc@vger.kernel.org>; Sun,  3 Jul 2022 21:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656909353;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=OCkbv3Cf/ewB5K2eBAbJzqiucJZei1sySPuP3qYRfnk=;
        b=B8DeEfJpR8jWl78VgCQeyhrh1qY7rI95Cju7Wx3MTGJZP/MHpt0+xB/dDuyQ3PuADNV3vo
        aG8hKp+N8QFrYvBmCM0eKm9d7xut7eATupYznqFLMj5W3MLW6IsEdF0o+B9zTZhbm/j3nt
        O7FpE5vGVmc0gDDev0r6YGaaUQA9/ww=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-384-ujQ8JiXQO4-02fGLI2SI8Q-1; Mon, 04 Jul 2022 00:35:50 -0400
X-MC-Unique: ujQ8JiXQO4-02fGLI2SI8Q-1
Received: by mail-lf1-f71.google.com with SMTP id y35-20020a0565123f2300b0047f70612402so2584482lfa.12
        for <linux-remoteproc@vger.kernel.org>; Sun, 03 Jul 2022 21:35:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OCkbv3Cf/ewB5K2eBAbJzqiucJZei1sySPuP3qYRfnk=;
        b=lIkoE+ITI04Ac8EzyIZxRY4M4xTVNwGtPAq0JQmA0B9SAOMV0MMIaFHMyM7WF9X8MD
         YKSHMrJcZzxoCtFnRPl5NPSrOzcymHA58saf7NDVf4RAv7YZT/EAAZzsQiTqqDnqCcUG
         qa/FRT7lqTGJGIJkm5FgjGml3m29JkkTGRvZYuMPEZThCf/4Wt2ptiYSUyIKJ9nrPVKV
         afQisVYoWRJgeMVCBPkLvY81RWNe64+pVTeXkif4qmQ49xHTsu22dh3wab0jLFCBTwGI
         l1xkLMcMSwC4nAybwqBzfIDOqxxjk/mczm7q8TdYI/XcGZMwLJAUUeG8H3EAGXrqZDxS
         7RGw==
X-Gm-Message-State: AJIora9SZEMULIWBwleJrO1wJwIMJ61ShzE3muvT//gI5fXymS5Mk4aq
        tGevwagvcfMkxPXR1a/VYK8uppVyB5VtDLqLlPKgZCLaBf9ZM/hNHQ4e3M81z4zmHpe15dPRiCg
        Q1/bkiNuygg/S8ucqEWPJoo/zdwEWoTMjdm2FiHcokgXfgw==
X-Received: by 2002:a2e:9799:0:b0:25d:15f5:228e with SMTP id y25-20020a2e9799000000b0025d15f5228emr4942289lji.251.1656909347811;
        Sun, 03 Jul 2022 21:35:47 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tcvswtM6JMnT0NY9Gc4qiCju7VRajzTVCSlRuuO9lTUrwgo9jWzyBeZSF0aiVmkCjl7CaDYPK6X+E1ASeWrF8=
X-Received: by 2002:a2e:9799:0:b0:25d:15f5:228e with SMTP id
 y25-20020a2e9799000000b0025d15f5228emr4942267lji.251.1656909347454; Sun, 03
 Jul 2022 21:35:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220608171334.730739-1-apatel@ventanamicro.com>
 <20220629174318.GB2018382@p14s> <bf87a50c-6d92-8657-72a9-75af81d2489f@foss.st.com>
 <CANLsYkzHZMV3eVUn3Xpk0eiAexyr9HC5__K9xfAwfm23nuQj=A@mail.gmail.com>
 <20220630152003-mutt-send-email-mst@kernel.org> <CACGkMEtHuoHT6meHacsie8M87yjUX3jGEvP7BuU_Vrb3yqkDWw@mail.gmail.com>
 <20220701021536-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220701021536-mutt-send-email-mst@kernel.org>
From:   Jason Wang <jasowang@redhat.com>
Date:   Mon, 4 Jul 2022 12:35:36 +0800
Message-ID: <CACGkMEtkVmq2+NtDpp-XWZFD_WO6Dzm4=pcVwg-aKmStAqJCVg@mail.gmail.com>
Subject: Re: [PATCH] rpmsg: virtio: Fix broken rpmsg_probe()
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
        Anup Patel <apatel@ventanamicro.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Atish Patra <atishp@atishpatra.org>,
        Alistair Francis <Alistair.Francis@wdc.com>,
        Anup Patel <anup@brainfault.org>,
        linux-remoteproc@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        virtualization <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Jul 1, 2022 at 2:16 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Fri, Jul 01, 2022 at 09:22:15AM +0800, Jason Wang wrote:
> > On Fri, Jul 1, 2022 at 3:20 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Thu, Jun 30, 2022 at 11:51:30AM -0600, Mathieu Poirier wrote:
> > > > + virtualization@lists.linux-foundation.org
> > > > + jasowang@redhat.com
> > > > + mst@redhat.com
> > > >
> > > > On Thu, 30 Jun 2022 at 10:20, Arnaud POULIQUEN
> > > > <arnaud.pouliquen@foss.st.com> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > On 6/29/22 19:43, Mathieu Poirier wrote:
> > > > > > Hi Anup,
> > > > > >
> > > > > > On Wed, Jun 08, 2022 at 10:43:34PM +0530, Anup Patel wrote:
> > > > > >> The rpmsg_probe() is broken at the moment because virtqueue_add_inbuf()
> > > > > >> fails due to both virtqueues (Rx and Tx) marked as broken by the
> > > > > >> __vring_new_virtqueue() function. To solve this, virtio_device_ready()
> > > > > >> (which unbreaks queues) should be called before virtqueue_add_inbuf().
> > > > > >>
> > > > > >> Fixes: 8b4ec69d7e09 ("virtio: harden vring IRQ")
> > > > > >> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > > > > >> ---
> > > > > >>  drivers/rpmsg/virtio_rpmsg_bus.c | 6 +++---
> > > > > >>  1 file changed, 3 insertions(+), 3 deletions(-)
> > > > > >>
> > > > > >> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> > > > > >> index 905ac7910c98..71a64d2c7644 100644
> > > > > >> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> > > > > >> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> > > > > >> @@ -929,6 +929,9 @@ static int rpmsg_probe(struct virtio_device *vdev)
> > > > > >>      /* and half is dedicated for TX */
> > > > > >>      vrp->sbufs = bufs_va + total_buf_space / 2;
> > > > > >>
> > > > > >> +    /* From this point on, we can notify and get callbacks. */
> > > > > >> +    virtio_device_ready(vdev);
> > > > > >> +
> > > > > >
> > > > > > Calling virtio_device_ready() here means that virtqueue_get_buf_ctx_split() can
> > > > > > potentially be called (by way of rpmsg_recv_done()), which will race with
> > > > > > virtqueue_add_inbuf().  If buffers in the virtqueue aren't available then
> > > > > > rpmsg_recv_done() will fail, potentially breaking remote processors' state
> > > > > > machines that don't expect their initial name service to fail when the "device"
> > > > > > has been marked as ready.
> > > > > >
> > > > > > What does make me curious though is that nobody on the remoteproc mailing list
> > > > > > has complained about commit 8b4ec69d7e09 breaking their environment... By now,
> > > > > > i.e rc4, that should have happened.  Anyone from TI, ST and Xilinx care to test this on
> > > > > > their rig?
> > > > >
> > > > > I tested on STm32mp1 board using tag v5.19-rc4(03c765b0e3b4)
> > > > > I confirm the issue!
> > > > >
> > > > > Concerning the solution, I share Mathieu's concern. This could break legacy.
> > > > > I made a short test and I would suggest to use __virtio_unbreak_device instead, tounbreak the virtqueues without changing the init sequence.
> > > > >
> > > > > I this case the patch would be:
> > > > >
> > > > > +       /*
> > > > > +        * Unbreak the virtqueues to allow to add buffers before setting the vdev status
> > > > > +        * to ready
> > > > > +        */
> > > > > +       __virtio_unbreak_device(vdev);
> > > > > +
> > > > >
> > > > >         /* set up the receive buffers */
> > > > >         for (i = 0; i < vrp->num_bufs / 2; i++) {
> > > > >                 struct scatterlist sg;
> > > > >                 void *cpu_addr = vrp->rbufs + i * vrp->buf_size;
> > > >
> > > > This will indeed fix the problem.  On the flip side the kernel
> > > > documentation for __virtio_unbreak_device() puzzles me...
> > > > It clearly states that it should be used for probing and restoring but
> > > > _not_ directly by the driver.  Function rpmsg_probe() is part of
> > > > probing but also the entry point to a driver.
> > > >
> > > > Michael and virtualisation folks, is this the right way to move forward?
> > >
> > > I don't think it is, __virtio_unbreak_device is intended for core use.
> >
> > Can we fill the rx after virtio_device_ready() in this case?
> >
> > Btw, the driver set driver ok after registering, we probably get a svq
> > kick before DRIVER_OK?
> >
> > Thanks
>
> Is this an ack for the original patch?

Nope, I meant, instead of moving virtio_device_ready() a little bit
earlier, can we only move the rvq filling after virtio_device_ready().

Thanks

>
> > >
> > > > >
> > > > > Regards,
> > > > > Arnaud
> > > > >
> > > > > >
> > > > > > Thanks,
> > > > > > Mathieu
> > > > > >
> > > > > >>      /* set up the receive buffers */
> > > > > >>      for (i = 0; i < vrp->num_bufs / 2; i++) {
> > > > > >>              struct scatterlist sg;
> > > > > >> @@ -983,9 +986,6 @@ static int rpmsg_probe(struct virtio_device *vdev)
> > > > > >>       */
> > > > > >>      notify = virtqueue_kick_prepare(vrp->rvq);
> > > > > >>
> > > > > >> -    /* From this point on, we can notify and get callbacks. */
> > > > > >> -    virtio_device_ready(vdev);
> > > > > >> -
> > > > > >>      /* tell the remote processor it can start sending messages */
> > > > > >>      /*
> > > > > >>       * this might be concurrent with callbacks, but we are only
> > > > > >> --
> > > > > >> 2.34.1
> > > > > >>
> > >
>

