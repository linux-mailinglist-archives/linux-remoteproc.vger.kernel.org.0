Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5998E57F9C6
	for <lists+linux-remoteproc@lfdr.de>; Mon, 25 Jul 2022 08:57:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229987AbiGYG55 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 25 Jul 2022 02:57:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232137AbiGYG5m (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 25 Jul 2022 02:57:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8E097F15
        for <linux-remoteproc@vger.kernel.org>; Sun, 24 Jul 2022 23:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658732245;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qmW1hBnXSgXOK1sS9gN4+759LGb0Ym1b2aF+Hz+Xy9U=;
        b=PPhGBllWVvabbVQVeGNpYrkjYRPiC085JZEIVLd7t+hZcTZgbjXxReeX4mRTi7cA7d8JMx
        xvTPwn1baLVaMDK8Ah94ChDeZDn3KXQ9kzEkD7poe6BkiO50WsVb9xfV/rTnGLDzNmooe5
        DbN8EundsC8we50zNOqvnSirdBQlxsI=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-ghAiPX9OMliPZNQPlEsyDg-1; Mon, 25 Jul 2022 02:57:23 -0400
X-MC-Unique: ghAiPX9OMliPZNQPlEsyDg-1
Received: by mail-lj1-f197.google.com with SMTP id k1-20020a2e9201000000b0025dd56bd7a4so2136063ljg.17
        for <linux-remoteproc@vger.kernel.org>; Sun, 24 Jul 2022 23:57:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qmW1hBnXSgXOK1sS9gN4+759LGb0Ym1b2aF+Hz+Xy9U=;
        b=4JpbUffCAHh7AjSfQmizhvRB4H5flMfEQc1NMMXP7zTRYlQSBx4ADOR8aQOGhn+qg5
         ZJAHkaf+VPzkYhBukH4sEnAlntDTnvwnzsDeY8/8xkODFgmy/nBXE/l0XCTgDW8HbfVF
         SahLugZbFsflKkCcKgrhJsV1k/aDz2/BdJkHOVc6IMBjXsRNiS3g9LkRBWO1FX40IszV
         h61YBAynXJA8EqXaQdH9t25uk9alZR8rHyX6ZEKYU1rqrF4EPTbvKiwB3t8ZeDPkOOsA
         bXJmsdxfG9QkI+uOFYAQZ8uz7rpLxliYRuCQ9CV0kvg/ar0kxL4S+HccZgPbO52P0thx
         0ZyA==
X-Gm-Message-State: AJIora88oYxCEz6nz0FYFgnVaCUzekbGRtqZ8EpR5fT6vEeFR8QWXmLt
        dmg9c6jlX0Y6ja5FoxGgSklBdlvocAeDa4zH1JT72+F/jJxpI4IAv5M0YZ5EZ6BaRVKqqIvAdWE
        jpuCw0IeFxbD59XnKemwxh4v8yR3W0qQakM3Iu04mwLE0iQ==
X-Received: by 2002:ac2:4205:0:b0:48a:95e6:395c with SMTP id y5-20020ac24205000000b0048a95e6395cmr365160lfh.238.1658732242436;
        Sun, 24 Jul 2022 23:57:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1unkGiIlKuXLUSHpJBWTVSAU4zhX72Do0K+zbnbWWScjjTYkm8xiqqQ6k0g8uFHQC6oNFJAAG44P+Vps9/gr6o=
X-Received: by 2002:ac2:4205:0:b0:48a:95e6:395c with SMTP id
 y5-20020ac24205000000b0048a95e6395cmr365123lfh.238.1658732242186; Sun, 24 Jul
 2022 23:57:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220720030436.79520-1-xuanzhuo@linux.alibaba.com>
 <20220720030436.79520-39-xuanzhuo@linux.alibaba.com> <726a5056-789a-b445-a2c6-879008ad270a@redhat.com>
 <1658731116.1695666-1-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1658731116.1695666-1-xuanzhuo@linux.alibaba.com>
From:   Jason Wang <jasowang@redhat.com>
Date:   Mon, 25 Jul 2022 14:57:11 +0800
Message-ID: <CACGkMEvsAyR5uRprobv-bQYPOKKOM4sZzQ-Vw5ZiETMjiCkdRQ@mail.gmail.com>
Subject: Re: [PATCH v12 38/40] virtio_net: support rx queue resize
To:     Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc:     Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Cornelia Huck <cohuck@redhat.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        Eric Farman <farman@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        linux-um@lists.infradead.org, netdev <netdev@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
        kvm <kvm@vger.kernel.org>,
        "open list:XDP (eXpress Data Path)" <bpf@vger.kernel.org>,
        Kangjie Xu <kangjie.xu@linux.alibaba.com>,
        virtualization <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Jul 25, 2022 at 2:43 PM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrot=
e:
>
> On Thu, 21 Jul 2022 17:25:59 +0800, Jason Wang <jasowang@redhat.com> wrot=
e:
> >
> > =E5=9C=A8 2022/7/20 11:04, Xuan Zhuo =E5=86=99=E9=81=93:
> > > This patch implements the resize function of the rx queues.
> > > Based on this function, it is possible to modify the ring num of the
> > > queue.
> > >
> > > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > ---
> > >   drivers/net/virtio_net.c | 22 ++++++++++++++++++++++
> > >   1 file changed, 22 insertions(+)
> > >
> > > diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> > > index fe4dc43c05a1..1115a8b59a08 100644
> > > --- a/drivers/net/virtio_net.c
> > > +++ b/drivers/net/virtio_net.c
> > > @@ -278,6 +278,8 @@ struct padded_vnet_hdr {
> > >     char padding[12];
> > >   };
> > >
> > > +static void virtnet_rq_free_unused_buf(struct virtqueue *vq, void *b=
uf);
> > > +
> > >   static bool is_xdp_frame(void *ptr)
> > >   {
> > >     return (unsigned long)ptr & VIRTIO_XDP_FLAG;
> > > @@ -1846,6 +1848,26 @@ static netdev_tx_t start_xmit(struct sk_buff *=
skb, struct net_device *dev)
> > >     return NETDEV_TX_OK;
> > >   }
> > >
> > > +static int virtnet_rx_resize(struct virtnet_info *vi,
> > > +                        struct receive_queue *rq, u32 ring_num)
> > > +{
> > > +   int err, qindex;
> > > +
> > > +   qindex =3D rq - vi->rq;
> > > +
> > > +   napi_disable(&rq->napi);
> >
> >
> > We need to disable refill work as well. So this series might need
> > rebasing on top of
> >
> > https://lore.kernel.org/netdev/20220704074859.16912-1-jasowang@redhat.c=
om/
>
> I understand that your patch is used to solve the situation where dev is
> destoryed but refill work is running.
>
> And is there such a possibility here?

E.g the refill work runs in parallel with this function?

Thanks

> Or is there any other scenario that I'm
> not expecting?
>
> Thanks.
>
>
> >
> > I will send a new version (probably tomorrow).
> >
> > Thanks
> >
> >
> > > +
> > > +   err =3D virtqueue_resize(rq->vq, ring_num, virtnet_rq_free_unused=
_buf);
> > > +   if (err)
> > > +           netdev_err(vi->dev, "resize rx fail: rx queue index: %d e=
rr: %d\n", qindex, err);
> > > +
> > > +   if (!try_fill_recv(vi, rq, GFP_KERNEL))
> > > +           schedule_delayed_work(&vi->refill, 0);
> > > +
> > > +   virtnet_napi_enable(rq->vq, &rq->napi);
> > > +   return err;
> > > +}
> > > +
> > >   /*
> > >    * Send command via the control virtqueue and check status.  Comman=
ds
> > >    * supported by the hypervisor, as indicated by feature bits, shoul=
d
> >
>

