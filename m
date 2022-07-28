Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E17025836FC
	for <lists+linux-remoteproc@lfdr.de>; Thu, 28 Jul 2022 04:36:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237543AbiG1Cgu (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 27 Jul 2022 22:36:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237618AbiG1Cgs (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 27 Jul 2022 22:36:48 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6D8C0550BD
        for <linux-remoteproc@vger.kernel.org>; Wed, 27 Jul 2022 19:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658975805;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JKkkMBWIpIIe2oTOsj/mSHWBLF5WPUCRKemqNyKpd7k=;
        b=dtoMUgtwVVMSpWU8MGeuogtfjUKmLeuylbFpR6cCNpeyiWkmIm/0mDPAYwQ9s3EDmI4/jB
        MEBgt3nn3eOfrCK4mfgZfIRKtOxkPOr+D03+U1iPBy7ekbsGk+jJ7OVodGzT3viN3IRLBz
        EUqzvda50y5RMPE00vWFYIceIt7WxKc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-64-B41y7I9mP_WZURgwmtwaow-1; Wed, 27 Jul 2022 22:36:44 -0400
X-MC-Unique: B41y7I9mP_WZURgwmtwaow-1
Received: by mail-ej1-f69.google.com with SMTP id nb10-20020a1709071c8a00b006e8f89863ceso123046ejc.18
        for <linux-remoteproc@vger.kernel.org>; Wed, 27 Jul 2022 19:36:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JKkkMBWIpIIe2oTOsj/mSHWBLF5WPUCRKemqNyKpd7k=;
        b=yQexXX4arQwGbcdzFVYUuhpFIVNdxcI9YMMTLb+FfFJeJi7ARWphVmLNqd07fb7h60
         KkzjVDfMCZybnepWKoAe0ockuaN6DW4ReuOsMkj2HwF1avpBD7X+r9OHfX9mnxKZcNqx
         ygjcAl5jRZjz4QSvpuU6QMxmgy0Suk1mZPT58pu+y8XEdkoQ2HqxLSAmddbxgV0fFFG8
         FGNiFbR8UFNYZfyGEfOhD8WpFFVnaoBO5ZUdWKGppVdpD6ocRoUZ7hWJDD9HV52K8uLR
         3aZLTmfmZNMYn6GRuCTxzneMqN5VKnxvRN2Mqgb1tVhCJ2Y6qoU5oGuXZB8vqWE0PR0s
         1VOg==
X-Gm-Message-State: AJIora/4hi0WtOOTO3lvdNkfapyLsL0Kdsb4oLbo/QFjumcnl+5DXUwJ
        kvf9Tsr5rDpEgdJ/IofBzq+RS4MGFN2838CF2e94QPYtgSiVLzMHTxyDrBzEUw6ay0xYNW9jVD/
        251x+KWuC7WeTDzIc49SON9U8VWHA1WUlIte3bxzI1k2IQg==
X-Received: by 2002:a17:907:a063:b0:72b:52f7:feea with SMTP id ia3-20020a170907a06300b0072b52f7feeamr20017151ejc.740.1658975799929;
        Wed, 27 Jul 2022 19:36:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uGPEobsHGsN+6u62z1/vXP5Tu4y+DTY3UAmlLElWTmVhegB4KOwUXCDIsRewcmE149sdCA2s8SYedOFlVJtFU=
X-Received: by 2002:a17:907:a063:b0:72b:52f7:feea with SMTP id
 ia3-20020a170907a06300b0072b52f7feeamr20017130ejc.740.1658975799433; Wed, 27
 Jul 2022 19:36:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220726072225.19884-1-xuanzhuo@linux.alibaba.com>
 <20220726072225.19884-8-xuanzhuo@linux.alibaba.com> <a5449e49-ba38-9760-ac07-cfad048bc602@redhat.com>
 <1658907340.34387-1-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1658907340.34387-1-xuanzhuo@linux.alibaba.com>
From:   Jason Wang <jasowang@redhat.com>
Date:   Thu, 28 Jul 2022 10:36:28 +0800
Message-ID: <CACGkMEuP8e3znP9ZjsoHbzTFZPRt25nHVam390yrwEsLPCH+YQ@mail.gmail.com>
Subject: Re: [PATCH v13 07/42] virtio_ring: split: stop __vring_new_virtqueue
 as export symbol
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
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Jul 27, 2022 at 3:36 PM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrot=
e:
>
> On Wed, 27 Jul 2022 10:58:05 +0800, Jason Wang <jasowang@redhat.com> wrot=
e:
> >
> > =E5=9C=A8 2022/7/26 15:21, Xuan Zhuo =E5=86=99=E9=81=93:
> > > There is currently only one place to reference __vring_new_virtqueue(=
)
> > > directly from the outside of virtio core. And here vring_new_virtqueu=
e()
> > > can be used instead.
> > >
> > > Subsequent patches will modify __vring_new_virtqueue, so stop it as a=
n
> > > export symbol for now.
> > >
> > > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > ---
> > >   drivers/virtio/virtio_ring.c | 25 ++++++++++++++++---------
> > >   include/linux/virtio_ring.h  | 10 ----------
> > >   tools/virtio/virtio_test.c   |  4 ++--
> > >   3 files changed, 18 insertions(+), 21 deletions(-)
> > >
> > > diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_rin=
g.c
> > > index 0ad35eca0d39..4e54ed7ee7fb 100644
> > > --- a/drivers/virtio/virtio_ring.c
> > > +++ b/drivers/virtio/virtio_ring.c
> > > @@ -204,6 +204,14 @@ struct vring_virtqueue {
> > >   #endif
> > >   };
> > >
> > > +static struct virtqueue *__vring_new_virtqueue(unsigned int index,
> > > +                                          struct vring vring,
> > > +                                          struct virtio_device *vdev=
,
> > > +                                          bool weak_barriers,
> > > +                                          bool context,
> > > +                                          bool (*notify)(struct virt=
queue *),
> > > +                                          void (*callback)(struct vi=
rtqueue *),
> > > +                                          const char *name);
> > >
> > >   /*
> > >    * Helpers.
> > > @@ -2197,14 +2205,14 @@ irqreturn_t vring_interrupt(int irq, void *_v=
q)
> > >   EXPORT_SYMBOL_GPL(vring_interrupt);
> > >
> > >   /* Only available for split ring */
> > > -struct virtqueue *__vring_new_virtqueue(unsigned int index,
> > > -                                   struct vring vring,
> > > -                                   struct virtio_device *vdev,
> > > -                                   bool weak_barriers,
> > > -                                   bool context,
> > > -                                   bool (*notify)(struct virtqueue *=
),
> > > -                                   void (*callback)(struct virtqueue=
 *),
> > > -                                   const char *name)
> > > +static struct virtqueue *__vring_new_virtqueue(unsigned int index,
> > > +                                          struct vring vring,
> > > +                                          struct virtio_device *vdev=
,
> > > +                                          bool weak_barriers,
> > > +                                          bool context,
> > > +                                          bool (*notify)(struct virt=
queue *),
> > > +                                          void (*callback)(struct vi=
rtqueue *),
> > > +                                          const char *name)
> > >   {
> > >     struct vring_virtqueue *vq;
> > >
> > > @@ -2272,7 +2280,6 @@ struct virtqueue *__vring_new_virtqueue(unsigne=
d int index,
> > >     kfree(vq);
> > >     return NULL;
> > >   }
> > > -EXPORT_SYMBOL_GPL(__vring_new_virtqueue);
> > >
> > >   struct virtqueue *vring_create_virtqueue(
> > >     unsigned int index,
> > > diff --git a/include/linux/virtio_ring.h b/include/linux/virtio_ring.=
h
> > > index b485b13fa50b..8b8af1a38991 100644
> > > --- a/include/linux/virtio_ring.h
> > > +++ b/include/linux/virtio_ring.h
> > > @@ -76,16 +76,6 @@ struct virtqueue *vring_create_virtqueue(unsigned =
int index,
> > >                                      void (*callback)(struct virtqueu=
e *vq),
> > >                                      const char *name);
> > >
> > > -/* Creates a virtqueue with a custom layout. */
> > > -struct virtqueue *__vring_new_virtqueue(unsigned int index,
> > > -                                   struct vring vring,
> > > -                                   struct virtio_device *vdev,
> > > -                                   bool weak_barriers,
> > > -                                   bool ctx,
> > > -                                   bool (*notify)(struct virtqueue *=
),
> > > -                                   void (*callback)(struct virtqueue=
 *),
> > > -                                   const char *name);
> > > -
> > >   /*
> > >    * Creates a virtqueue with a standard layout but a caller-allocate=
d
> > >    * ring.
> > > diff --git a/tools/virtio/virtio_test.c b/tools/virtio/virtio_test.c
> > > index 23f142af544a..86a410ddcedd 100644
> > > --- a/tools/virtio/virtio_test.c
> > > +++ b/tools/virtio/virtio_test.c
> > > @@ -102,8 +102,8 @@ static void vq_reset(struct vq_info *info, int nu=
m, struct virtio_device *vdev)
> > >
> > >     memset(info->ring, 0, vring_size(num, 4096));
> > >     vring_init(&info->vring, num, info->ring, 4096);
> >
> >
> > Let's remove the duplicated vring_init() here.
> >
> > With this removed:
>
> The reason I didn't delete this vring_init() is because info->vring is us=
ed
> elsewhere. So it can't be deleted directly.

Ok, so we can leave it for future refactoring.

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

>
> Thanks.
>
> >
> > Acked-by: Jason Wang <jasowang@redhat.com>
> >
> >
> > > -   info->vq =3D __vring_new_virtqueue(info->idx, info->vring, vdev, =
true,
> > > -                                    false, vq_notify, vq_callback, "=
test");
> > > +   info->vq =3D vring_new_virtqueue(info->idx, num, 4096, vdev, true=
, false,
> > > +                                  info->ring, vq_notify, vq_callback=
, "test");
> > >     assert(info->vq);
> > >     info->vq->priv =3D info;
> > >   }
> >
>

