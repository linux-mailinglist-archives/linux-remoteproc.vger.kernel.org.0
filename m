Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C2B4358AB
	for <lists+linux-remoteproc@lfdr.de>; Wed,  5 Jun 2019 10:37:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbfFEIhG (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 5 Jun 2019 04:37:06 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:37729 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726674AbfFEIhG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 5 Jun 2019 04:37:06 -0400
Received: by mail-qk1-f194.google.com with SMTP id d15so4627440qkl.4;
        Wed, 05 Jun 2019 01:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tZieU7je7dwACZOpiX/W/qQoegULVXN7DFruA4ARRJ8=;
        b=u/ojFp5ZAddxsNGGYbN7XlNY/8foSU77uwy/au53Uchkct9OZEx2b4iQvgL9jR7dFt
         KL0AAlrpGzAtvblQTlwbbs3B7+/BrkJpYxDPbT927+7Q7a5OjfyGJCt/FJJgGCIFO62W
         Sqp3w0cDfwyEywLd3h1Qj2KRgilP9ut/ktBCnrJp2ki0jhGpNwMskcFOFTaFMb0eMI/w
         a59ETLqIqtTJRSA700wrFc9SuViJO5hlX5lUgI0ayoLUxo0+zv6K6ReGA/UJY44c+AMN
         H+28/oQc4DqgNcWCwrF831v29e4PsQzgR3863Xr29v6bC9CKBPg/0ZsDqV8cPGX92CJZ
         NSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tZieU7je7dwACZOpiX/W/qQoegULVXN7DFruA4ARRJ8=;
        b=bOGBQbfse3u0P08EVd1LtL4HtrePdx6kWxbW7GqQKnxhfCpRjx7SPF/Ogc7Fnm7Jcu
         IzexWci+l7UEvetCIe2B3h88BFJa5rHUkBDwjDHg3CZTj6nNEfqEjwg6BqqNZ4MJ9f1Y
         6vaR2+jT2KMosVS5epRw2yXGsKZ3rihwXTyfFaGilZ/BOO4XNHldmOYEfxRGZ7kEe84j
         eYMPw5KqF2ckrBJRunqgwGbxf3Fn5LrrojFj+uOFzkoh85IyaFd9Ez6fDYGHkf3yNPNg
         ia0AX17w1bw3EzuQQlXqHXihpb7rBTibICxWkSBGWy2fG1YQf6JJTDDK4eqDT81eZtxm
         7tWg==
X-Gm-Message-State: APjAAAUUwD87Lydd1s2Na4lsV9VTyLwzoqBMF7oo58mJqn18q8mFdTi7
        2E+Pkeve+tA7bfEUKaezMTMxe/FuHCCYECiF64w=
X-Google-Smtp-Source: APXvYqxdgj7ldEjyXZzBxU6wLtiP1XwJg+kkoImBzw4MUTV143AaNJo43dn5oEa5GU1oRBGK1blW6Uvp6rxq83G3S8U=
X-Received: by 2002:a05:620a:1443:: with SMTP id i3mr12354690qkl.11.1559723825237;
 Wed, 05 Jun 2019 01:37:05 -0700 (PDT)
MIME-Version: 1.0
References: <1548949280-31794-1-git-send-email-xiaoxiang@xiaomi.com>
 <1548949280-31794-4-git-send-email-xiaoxiang@xiaomi.com> <bc0e287e-cadd-c61c-c6c4-28cad642b9eb@st.com>
 <CAH2Cfb_kCvyYpRS8BVgkmA0W7ZHjjCXcC7nhaXji2oMOuqm76w@mail.gmail.com>
 <eb650649-e8cc-dd7a-c579-7ffb580273b9@st.com> <CAH2Cfb8QOjDPRa9p--9qcnbJ7mbosDKXg59OQeVxB44GGY3_3w@mail.gmail.com>
 <9598031a-5f0a-ad0d-dea6-5682b1a03b73@st.com>
In-Reply-To: <9598031a-5f0a-ad0d-dea6-5682b1a03b73@st.com>
From:   xiang xiao <xiaoxiang781216@gmail.com>
Date:   Wed, 5 Jun 2019 16:36:54 +0800
Message-ID: <CAH2Cfb8DOPQqJsO2KWjhhUjTpt2dVOiHSt4aBm9gXhJ1L=XfnA@mail.gmail.com>
Subject: Re: [PATCH 3/3] rpmsg: virtio_rpmsg_bus: get buffer size from config space
To:     Arnaud Pouliquen <arnaud.pouliquen@st.com>
Cc:     Ohad Ben Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        wendy.liang@xilinx.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xiang Xiao <xiaoxiang@xiaomi.com>,
        Loic PALLARDY <loic.pallardy@st.com>,
        Suman Anna <s-anna@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Jun 5, 2019 at 4:02 PM Arnaud Pouliquen <arnaud.pouliquen@st.com> wrote:
>
>
>
> On 6/5/19 4:40 AM, xiang xiao wrote:
> > On Tue, Jun 4, 2019 at 10:25 PM Arnaud Pouliquen
> > <arnaud.pouliquen@st.com> wrote:
> >>
> >> Hello Xiang,
> >>
> >> On 5/9/19 3:00 PM, xiang xiao wrote:
> >>> On Thu, May 9, 2019 at 8:36 PM Arnaud Pouliquen <arnaud.pouliquen@st.com> wrote:
> >>>>
> >>>> Hello Xiang,
> >>>>
> >>>> Similar mechanism has been proposed by Loic 2 years ago (link to the
> >>>> series here https://lkml.org/lkml/2017/3/28/349).
> >>>>
> >>>> Did you see them? Regarding history, patches seem just on hold...
> >>>>
> >>>
> >>> Just saw this patchset, so it's common problem hit by many vendor,
> >>> rpmsg framework need to address it.:)
> >>>
> >>>> Main differences (except interesting RX/TX size split) seems that you
> >>>> - don't use the virtio_config_ops->get
> >>>
> >>> virtio_cread call virtio_config_ops->get internally, the ideal is same
> >>> for both patch, just the implementation detail is different.
> >>>
> >>>> - define a new feature VIRTIO_RPMSG_F_NS.
> >>>
> >>> I add this flag to keep the compatibility with old remote peer, and
> >>> also follow the common virito driver practice.
> >> I discussed with Loic, he is ok to go further with your patch and
> >> abandon his one. Please find some remarks below in-line
> >>>
> >>>>
> >>>> Regards
> >>>> Arnaud
> >>>>
> >>>>
> >>>> On 1/31/19 4:41 PM, Xiang Xiao wrote:
> >>>>> 512 bytes isn't always suitable for all case, let firmware
> >>>>> maker decide the best value from resource table.
> >>>>> enable by VIRTIO_RPMSG_F_BUFSZ feature bit.
> >>>>>
> >>>>> Signed-off-by: Xiang Xiao <xiaoxiang@xiaomi.com>
> >>>>> ---
> >>>>>  drivers/rpmsg/virtio_rpmsg_bus.c  | 50 +++++++++++++++++++++++++--------------
> >>>>>  include/uapi/linux/virtio_rpmsg.h | 24 +++++++++++++++++++
> >>>>>  2 files changed, 56 insertions(+), 18 deletions(-)
> >>>>>  create mode 100644 include/uapi/linux/virtio_rpmsg.h
> >>>>>
> >>>>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> >>>>> index 59c4554..049dd97 100644
> >>>>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> >>>>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> >>>>> @@ -16,6 +16,7 @@
> >>>>>  #include <linux/virtio.h>
> >>>>>  #include <linux/virtio_ids.h>
> >>>>>  #include <linux/virtio_config.h>
> >>>>> +#include <linux/virtio_rpmsg.h>
> >>>>>  #include <linux/scatterlist.h>
> >>>>>  #include <linux/dma-mapping.h>
> >>>>>  #include <linux/slab.h>
> >>>>> @@ -38,7 +39,8 @@
> >>>>>   * @sbufs:   kernel address of tx buffers
> >>>>>   * @num_rbufs:       total number of buffers for rx
> >>>>>   * @num_sbufs:       total number of buffers for tx
> >>>>> - * @buf_size:        size of one rx or tx buffer
> >>>>> + * @rbuf_size:       size of one rx buffer
> >>>>> + * @sbuf_size:       size of one tx buffer
> >>>>>   * @last_sbuf:       index of last tx buffer used
> >>>>>   * @rbufs_dma:       dma base addr of rx buffers
> >>>>>   * @sbufs_dma:       dma base addr of tx buffers
> >>>>> @@ -61,7 +63,8 @@ struct virtproc_info {
> >>>>>       void *rbufs, *sbufs;
> >>>>>       unsigned int num_rbufs;
> >>>>>       unsigned int num_sbufs;
> >>>>> -     unsigned int buf_size;
> >>>>> +     unsigned int rbuf_size;
> >>>>> +     unsigned int sbuf_size;
> >>>>>       int last_sbuf;
> >>>>>       dma_addr_t rbufs_dma;
> >>>>>       dma_addr_t sbufs_dma;
> >>>>> @@ -73,9 +76,6 @@ struct virtproc_info {
> >>>>>       struct rpmsg_endpoint *ns_ept;
> >>>>>  };
> >>>>>
> >>>>> -/* The feature bitmap for virtio rpmsg */
> >>>>> -#define VIRTIO_RPMSG_F_NS    0 /* RP supports name service notifications */
> >>>>> -
> >>>>>  /**
> >>>>>   * struct rpmsg_hdr - common header for all rpmsg messages
> >>>>>   * @src: source address
> >>>>> @@ -452,7 +452,7 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
> >>>>>
> >>>>>       /* either pick the next unused tx buffer */
> >>>>>       if (vrp->last_sbuf < vrp->num_sbufs)
> >>>>> -             ret = vrp->sbufs + vrp->buf_size * vrp->last_sbuf++;
> >>>>> +             ret = vrp->sbufs + vrp->sbuf_size * vrp->last_sbuf++;
> >>>>>       /* or recycle a used one */
> >>>>>       else
> >>>>>               ret = virtqueue_get_buf(vrp->svq, &len);
> >>>>> @@ -578,7 +578,7 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
> >>>>>        * messaging), or to improve the buffer allocator, to support
> >>>>>        * variable-length buffer sizes.
> >>>>>        */
> >>>>> -     if (len > vrp->buf_size - sizeof(struct rpmsg_hdr)) {
> >>>>> +     if (len > vrp->sbuf_size - sizeof(struct rpmsg_hdr)) {
> >>>>>               dev_err(dev, "message is too big (%d)\n", len);
> >>>>>               return -EMSGSIZE;
> >>>>>       }
> >>>>> @@ -718,7 +718,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
> >>>>>        * We currently use fixed-sized buffers, so trivially sanitize
> >>>>>        * the reported payload length.
> >>>>>        */
> >>>>> -     if (len > vrp->buf_size ||
> >>>>> +     if (len > vrp->rbuf_size ||
> >>>>>           msg->len > (len - sizeof(struct rpmsg_hdr))) {
> >>>>>               dev_warn(dev, "inbound msg too big: (%d, %d)\n", len, msg->len);
> >>>>>               return -EINVAL;
> >>>>> @@ -751,7 +751,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
> >>>>>               dev_warn(dev, "msg received with no recipient\n");
> >>>>>
> >>>>>       /* publish the real size of the buffer */
> >>>>> -     rpmsg_sg_init(&sg, msg, vrp->buf_size);
> >>>>> +     rpmsg_sg_init(&sg, msg, vrp->rbuf_size);
> >>>>>
> >>>>>       /* add the buffer back to the remote processor's virtqueue */
> >>>>>       err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, msg, GFP_KERNEL);
> >>>>> @@ -907,11 +907,24 @@ static int rpmsg_probe(struct virtio_device *vdev)
> >>>>>       else
> >>>>>               vrp->num_sbufs = MAX_RPMSG_NUM_BUFS;
> >>>>>
> >>>>> -     vrp->buf_size = MAX_RPMSG_BUF_SIZE;
> >>>>> +     /* try to get buffer size from config space */
> >>>>> +     if (virtio_has_feature(vdev, VIRTIO_RPMSG_F_BUFSZ)) {
> >>>>> +             /* note: virtio_rpmsg_config is defined from remote view */
> >>>>> +             virtio_cread(vdev, struct virtio_rpmsg_config,
> >>>>> +                          txbuf_size, &vrp->rbuf_size);
> >>>>> +             virtio_cread(vdev, struct virtio_rpmsg_config,
> >>>>> +                          rxbuf_size, &vrp->sbuf_size);
> >>>>> +     }
> >>>>> +
> >>>>> +     /* use the default if resource table doesn't provide one */
> >>>>> +     if (!vrp->rbuf_size)
> >>>>> +             vrp->rbuf_size = MAX_RPMSG_BUF_SIZE;
> >> In this case constant should be renamed DEFAULT_RPMSG_BUF_SIZE as it is
> >> no more a max value
> >
> > Yes, DEFAULT_RPMSG_BUF_SIZE is more reasonable now.
> >
> >>>>> +     if (!vrp->sbuf_size)
> >>>>> +             vrp->sbuf_size = MAX_RPMSG_BUF_SIZE;
> >> Here, if the config space exists you need to update it in consequence to
> >> ensure coherency with the remote processor config.
> >
> > The update is already done in if (virtio_has_feature(vdev,
> > VIRTIO_RPMSG_F_BUFSZ)), here just handle the zero value in config
> > space which mean the remote side want to use the default value even
> > VIRTIO_RPMSG_F_BUFSZ set.
> > For example:
> > 1.remote side want to change one direction buffer size, but keep
> > another direction as default
> > 2.or remote side want to change other config options(define in the
> > furture) not the buffer size
>
> In code above i can see a virtio_cread of the config structure, but no
> writing of it...
> I mentioned the configs space in the resource table itself.
> Without an update, you must ensure that both have the same default
> value... In addition, it makes sense that the master can update the
> buffer size according to some other constraints.

Get your point, thanks.

>
> >
> >>
> >>>>>
> >>>>>       /* allocate coherent memory for the buffers */
> >>>>>       vrp->rbufs = dma_alloc_coherent(vdev->dev.parent->parent,
> >>>>> -                                     vrp->num_rbufs * vrp->buf_size,
> >>>>> +                                     vrp->num_rbufs * vrp->rbuf_size,
> >>>>>                                       &vrp->rbufs_dma, GFP_KERNEL);
> >>>>>       if (!vrp->rbufs) {
> >>>>>               err = -ENOMEM;
> >>>>> @@ -922,7 +935,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
> >>>>>               vrp->rbufs, &vrp->rbufs_dma);
> >>>>>
> >>>>>       vrp->sbufs = dma_alloc_coherent(vdev->dev.parent->parent,
> >>>>> -                                     vrp->num_sbufs * vrp->buf_size,
> >>>>> +                                     vrp->num_sbufs * vrp->sbuf_size,
> >>>>>                                       &vrp->sbufs_dma, GFP_KERNEL);
> >>>>>       if (!vrp->sbufs) {
> >>>>>               err = -ENOMEM;
> >>>>> @@ -935,9 +948,9 @@ static int rpmsg_probe(struct virtio_device *vdev)
> >>>>>       /* set up the receive buffers */
> >>>>>       for (i = 0; i < vrp->num_rbufs; i++) {
> >>>>>               struct scatterlist sg;
> >>>>> -             void *cpu_addr = vrp->rbufs + i * vrp->buf_size;
> >>>>> +             void *cpu_addr = vrp->rbufs + i * vrp->rbuf_size;
> >>>>>
> >>>>> -             rpmsg_sg_init(&sg, cpu_addr, vrp->buf_size);
> >>>>> +             rpmsg_sg_init(&sg, cpu_addr, vrp->rbuf_size);
> >>>>>
> >>>>>               err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, cpu_addr,
> >>>>>                                         GFP_KERNEL);
> >>>>> @@ -984,11 +997,11 @@ static int rpmsg_probe(struct virtio_device *vdev)
> >>>>>
> >>>>>  free_sbufs:
> >>>>>       dma_free_coherent(vdev->dev.parent->parent,
> >>>>> -                       vrp->num_sbufs * vrp->buf_size,
> >>>>> +                       vrp->num_sbufs * vrp->sbuf_size,
> >>>>>                         vrp->sbufs, vrp->sbufs_dma);
> >>>>>  free_rbufs:
> >>>>>       dma_free_coherent(vdev->dev.parent->parent,
> >>>>> -                       vrp->num_rbufs * vrp->buf_size,
> >>>>> +                       vrp->num_rbufs * vrp->rbuf_size,
> >>>>>                         vrp->rbufs, vrp->rbufs_dma);
> >>>>>  vqs_del:
> >>>>>       vdev->config->del_vqs(vrp->vdev);
> >>>>> @@ -1023,10 +1036,10 @@ static void rpmsg_remove(struct virtio_device *vdev)
> >>>>>       vdev->config->del_vqs(vrp->vdev);
> >>>>>
> >>>>>       dma_free_coherent(vdev->dev.parent->parent,
> >>>>> -                       vrp->num_sbufs * vrp->buf_size,
> >>>>> +                       vrp->num_sbufs * vrp->sbuf_size,
> >>>>>                         vrp->sbufs, vrp->sbufs_dma);
> >>>>>       dma_free_coherent(vdev->dev.parent->parent,
> >>>>> -                       vrp->num_rbufs * vrp->buf_size,
> >>>>> +                       vrp->num_rbufs * vrp->rbuf_size,
> >>>>>                         vrp->rbufs, vrp->rbufs_dma);
> >>>>>
> >>>>>       kfree(vrp);
> >>>>> @@ -1039,6 +1052,7 @@ static struct virtio_device_id id_table[] = {
> >>>>>
> >>>>>  static unsigned int features[] = {
> >>>>>       VIRTIO_RPMSG_F_NS,
> >>>>> +     VIRTIO_RPMSG_F_BUFSZ,
> >>>>>  };
> >>>>>
> >>>>>  static struct virtio_driver virtio_ipc_driver = {
> >>>>> diff --git a/include/uapi/linux/virtio_rpmsg.h b/include/uapi/linux/virtio_rpmsg.h
> >>>>> new file mode 100644
> >>>>> index 0000000..24fa0dd
> >>>>> --- /dev/null
> >>>>> +++ b/include/uapi/linux/virtio_rpmsg.h
> >> Strange to define a user space API for kernel usage need. Could you
> >> elaborate?
> >
> > I just follow the practice other virtio drivers(e.g.
> > include/uapi/virtio_net.h) applied, but rpmsg driver don't need to
> > talk with the host VM software like other virtio driver, yes this
> > header file isn't really needed.
> >
> >>>>> @@ -0,0 +1,24 @@
> >>>>> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> >>>>> +/*
> >>>>> + * Copyright (C) Pinecone Inc. 2019
> >>>>> + * Copyright (C) Xiang Xiao <xiaoxiang@pinecone.net>
> >>>>> + */
> >>>>> +
> >>>>> +#ifndef _UAPI_LINUX_VIRTIO_RPMSG_H
> >>>>> +#define _UAPI_LINUX_VIRTIO_RPMSG_H
> >>>>> +
> >>>>> +#include <linux/types.h>
> >>>>> +
> >>>>> +/* The feature bitmap for virtio rpmsg */
> >>>>> +#define VIRTIO_RPMSG_F_NS    0 /* RP supports name service notifications */
> >>>>> +#define VIRTIO_RPMSG_F_BUFSZ 2 /* RP get buffer size from config space */
> >> Would be useful to document it in rpmsg.txt
> >
> > Good point, but it is better to put them into this document:
> > https://docs.oasis-open.org/virtio/virtio/v1.1/csprd01/virtio-v1.1-csprd01.html
> > like other vritio driver spec.
> >
> >>>>> +
> >>>>> +struct virtio_rpmsg_config {
> >>>>> +     /* The tx/rx individual buffer size(if VIRTIO_RPMSG_F_BUFSZ) */
> >>>>> +     __u32 txbuf_size;
> >>>>> +     __u32 rxbuf_size;
> >>>>> +     __u32 reserved[14]; /* Reserve for the future use */
> >>>>> +     /* Put the customize config here */
> >>>>> +} __attribute__((packed));
> >>>>> +
> >> Wouldn't it be better to add an identifier and a version fields at the
> >> beginning of the structure? Idea would be to simplify a future extension
> >> In this case is VIRTIO_RPMSG_F_BUFSZ still useful?
> >>
> >
> > Yes, I consider this option before, but after review all
> > include/uapi/virtio_*.h, I found that virito driver prefer feature
> > bits than version number to handle the compability issue.
> > For example, if we need introduce more options in the furture, we need:
> > 1.Add new feature bit to notice the option exist
> > 2.Allocate the field from reserved space
> >
> >>>>> +#endif /* _UAPI_LINUX_VIRTIO_RPMSG_H */
> >>>>>
> >> --
> >> Thanks
> >> Arnaud
