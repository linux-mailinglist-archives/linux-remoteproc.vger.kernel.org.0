Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00BBD56B2BA
	for <lists+linux-remoteproc@lfdr.de>; Fri,  8 Jul 2022 08:25:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237034AbiGHGVN (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 8 Jul 2022 02:21:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237290AbiGHGVN (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 8 Jul 2022 02:21:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1BD562C109
        for <linux-remoteproc@vger.kernel.org>; Thu,  7 Jul 2022 23:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657261271;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vucI6v2UNiSkfdv0+LNa4VjRInUBJ0CkIXv+ERyy8hk=;
        b=gr/1L6LVAyl1WDBk7lX5C5Biu9I6t+9otz3PFzFKD7LJ8NCIWtwFpWr/+xQ7EYCMMIhySo
        F4WOMX7jf/aImRODLZvPKnZY5/HS+RbIb1jQ1ULPn9lQhCTVWfrO21s6QQMW3+ltJmrMje
        /sRmr0qDN0DhxXNdRAM4CRsqyfR1pGA=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-Xcb7Z6UKNHeyBiYwArnacw-1; Fri, 08 Jul 2022 02:21:05 -0400
X-MC-Unique: Xcb7Z6UKNHeyBiYwArnacw-1
Received: by mail-lj1-f199.google.com with SMTP id bd19-20020a05651c169300b0025d47eb32cfso1699719ljb.22
        for <linux-remoteproc@vger.kernel.org>; Thu, 07 Jul 2022 23:21:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vucI6v2UNiSkfdv0+LNa4VjRInUBJ0CkIXv+ERyy8hk=;
        b=udVMKXXOser2rGn6+4EI3zcMAPtYPjKtJsNpaUuozhPp1zlaotyDPpWgQawyJixr6n
         /prkqqcWxcpnVuLWp0JioA2GakR26UClpJky/B3zl9qOfO57iqKPF6JCjacn2qWjmDuw
         O7saajukyfe5Qi5vYlJcr3FPBJVLNlWJJYYibdL4yfKlqyp6VXTxH+Ppsd3IQXNgqMjx
         wDrjvd4TDscBHQVGyh+TxjfxBSWchZKEJ6TND8n/W/sMW06i7NzI2yjS3gu1kJnk+b5O
         K1NI9SNur9gmqHNvmlMq76RFx4SX1lRqaayKEmSl+lHYmaDongkajegGOV4Ts34FuQfz
         PUwA==
X-Gm-Message-State: AJIora/T74Ic4x/tD04arAOxTEyiKv19pfl8fdnXf83GAqlPZm9q0nfk
        hKnNPMuBYnhxNUmqRPBeDCe3eYFJBIunKOyOtfhupVqPW+bHuB3YxcQnrUgMNr079bYblneRgH1
        2NWximLRKLEDKAUbAOpIjgVIqGOD5rhjIezfbOrq3zESzaA==
X-Received: by 2002:a2e:9ad0:0:b0:25a:7156:26bb with SMTP id p16-20020a2e9ad0000000b0025a715626bbmr999488ljj.141.1657261263912;
        Thu, 07 Jul 2022 23:21:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1siGvuif2Z3b/qz6BV5rwXiRX4Y2KnHOm/sW0UQhHOR8L3Ua/tIp6J6o+V7iV6847cM54TvfHUP9+sN1Wog1zw=
X-Received: by 2002:a2e:9ad0:0:b0:25a:7156:26bb with SMTP id
 p16-20020a2e9ad0000000b0025a715626bbmr999458ljj.141.1657261263714; Thu, 07
 Jul 2022 23:21:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220629065656.54420-1-xuanzhuo@linux.alibaba.com>
 <20220629065656.54420-39-xuanzhuo@linux.alibaba.com> <c0747cbc-685b-85a9-1931-0124124755f2@redhat.com>
 <1656986375.3420787-1-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1656986375.3420787-1-xuanzhuo@linux.alibaba.com>
From:   Jason Wang <jasowang@redhat.com>
Date:   Fri, 8 Jul 2022 14:20:52 +0800
Message-ID: <CACGkMEu80KP-ULz_CBvauRk_3XsCubMkkWv0uLnbt-wib5KOnA@mail.gmail.com>
Subject: Re: [PATCH v11 38/40] virtio_net: support rx queue resize
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
        kangjie.xu@linux.alibaba.com,
        virtualization <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Jul 5, 2022 at 10:00 AM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrot=
e:
>
> On Mon, 4 Jul 2022 11:44:12 +0800, Jason Wang <jasowang@redhat.com> wrote=
:
> >
> > =E5=9C=A8 2022/6/29 14:56, Xuan Zhuo =E5=86=99=E9=81=93:
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
> > > index 9fe222a3663a..6ab16fd193e5 100644
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
> > Do we need to cancel the refill work here?
>
>
> I think no, napi_disable is mutually exclusive, which ensures that there =
will be
> no conflicts between them.

So this sounds similar to what I've fixed recently.

1) NAPI schedule delayed work.
2) we disable NAPI here
3) delayed work get schedule and call NAPI again

?

Thanks

>
> Thanks.
>
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

