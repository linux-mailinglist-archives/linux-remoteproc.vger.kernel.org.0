Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 926FA58370F
	for <lists+linux-remoteproc@lfdr.de>; Thu, 28 Jul 2022 04:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234776AbiG1CjL (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 27 Jul 2022 22:39:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237754AbiG1CjI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 27 Jul 2022 22:39:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 35EFD5A8AA
        for <linux-remoteproc@vger.kernel.org>; Wed, 27 Jul 2022 19:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658975946;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5ymtTMNSBtFOhhmPgtQl8t8lfFLbeHZYYSYD2cD7gjw=;
        b=IGDwc89h5aJWj1EBZQWTY3a46nF+BN8BwCxay9u3ZNWYq0Kob0JyupLtJOWIrn3vEX0kzP
        UrjlgHpZWe5wDeQu7zWlGtoVXAXYuszAaTwq7DiqIliKHTF8gv46KDrXJsvR8qbZHAkB45
        nkbcJi4dphFgrhM4QEdRe0Z82F9Qn54=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-Fe_LRFYQPEaIZupI7FpIzQ-1; Wed, 27 Jul 2022 22:39:04 -0400
X-MC-Unique: Fe_LRFYQPEaIZupI7FpIzQ-1
Received: by mail-lf1-f71.google.com with SMTP id w8-20020a197b08000000b00489e72a3025so229464lfc.4
        for <linux-remoteproc@vger.kernel.org>; Wed, 27 Jul 2022 19:39:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5ymtTMNSBtFOhhmPgtQl8t8lfFLbeHZYYSYD2cD7gjw=;
        b=fIVFAehTAXIVdiZMNrNmiofbnpB/kmoLHBi7olQXn+cAMo4RaWltq6+R3HT+HwwAjw
         2f109fmqwbIjiApKWREf+BsYldxJ9tND0bgzUqYqb+FSrwwIquXDdcJUn7a3VpXPz8oq
         FE8jeSy+8wLBz6xe2sXBDOB7FCbxbodzAGUCnMDNAdUL6QU+ADqKwPrSkOO2Av0ihGcU
         ourlV4lBRdIo6D4ThDymxEfMsT0YlSW/te0iAiFV3Ok+Kn0wWA0UWsIaGwT/3tI7IZz7
         RjqXRJ6dLgHkPTAHQCf/PJZ6rTq8+/PXu4b4YUScMse5D5V6sDtM8/Ofz57G7mPlivKi
         7TiA==
X-Gm-Message-State: AJIora89InoILS1N8cH/kc0NMwphlJsH9jaHhvXytEBh9+OJA+AMQOMO
        pwGK7598OIFS2/mbCcopnH3brRog/yp3g4L1NeSsbwCUCMXxNz2441JMFr6tTX3BPVUh82cmMhG
        n3BFyUe40Eoz6YsXBzqjCtEKXWulMXJ4c49X4aXtoP6V3yw==
X-Received: by 2002:a05:651c:2103:b0:25d:6478:2a57 with SMTP id a3-20020a05651c210300b0025d64782a57mr8391226ljq.496.1658975943173;
        Wed, 27 Jul 2022 19:39:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uHdGB5CGdI+a5RxWiQio7u+TOL7GEOspu6vejhdOqf5wuC1xMtb49c5PXiFMMNBwahHTh2HSqnjfW+BjjqQXo=
X-Received: by 2002:a05:651c:2103:b0:25d:6478:2a57 with SMTP id
 a3-20020a05651c210300b0025d64782a57mr8391199ljq.496.1658975942872; Wed, 27
 Jul 2022 19:39:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220726072225.19884-1-xuanzhuo@linux.alibaba.com>
 <20220726072225.19884-17-xuanzhuo@linux.alibaba.com> <15aa26f2-f8af-5dbd-f2b2-9270ad873412@redhat.com>
 <1658907413.1860468-2-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1658907413.1860468-2-xuanzhuo@linux.alibaba.com>
From:   Jason Wang <jasowang@redhat.com>
Date:   Thu, 28 Jul 2022 10:38:51 +0800
Message-ID: <CACGkMEvxsOfiiaWWAR8P68GY1yfwgTvaAbHk1JF7pTw-o2k25w@mail.gmail.com>
Subject: Re: [PATCH v13 16/42] virtio_ring: split: introduce virtqueue_resize_split()
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

On Wed, Jul 27, 2022 at 3:44 PM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrot=
e:
>
> On Wed, 27 Jul 2022 11:12:19 +0800, Jason Wang <jasowang@redhat.com> wrot=
e:
> >
> > =E5=9C=A8 2022/7/26 15:21, Xuan Zhuo =E5=86=99=E9=81=93:
> > > virtio ring split supports resize.
> > >
> > > Only after the new vring is successfully allocated based on the new n=
um,
> > > we will release the old vring. In any case, an error is returned,
> > > indicating that the vring still points to the old vring.
> > >
> > > In the case of an error, re-initialize(virtqueue_reinit_split()) the
> > > virtqueue to ensure that the vring can be used.
> > >
> > > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > Acked-by: Jason Wang <jasowang@redhat.com>
> > > ---
> > >   drivers/virtio/virtio_ring.c | 34 +++++++++++++++++++++++++++++++++=
+
> > >   1 file changed, 34 insertions(+)
> > >
> > > diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_rin=
g.c
> > > index b6fda91c8059..58355e1ac7d7 100644
> > > --- a/drivers/virtio/virtio_ring.c
> > > +++ b/drivers/virtio/virtio_ring.c
> > > @@ -220,6 +220,7 @@ static struct virtqueue *__vring_new_virtqueue(un=
signed int index,
> > >                                            void (*callback)(struct vi=
rtqueue *),
> > >                                            const char *name);
> > >   static struct vring_desc_extra *vring_alloc_desc_extra(unsigned int=
 num);
> > > +static void vring_free(struct virtqueue *_vq);
> > >
> > >   /*
> > >    * Helpers.
> > > @@ -1117,6 +1118,39 @@ static struct virtqueue *vring_create_virtqueu=
e_split(
> > >     return vq;
> > >   }
> > >
> > > +static int virtqueue_resize_split(struct virtqueue *_vq, u32 num)
> > > +{
> > > +   struct vring_virtqueue_split vring_split =3D {};
> > > +   struct vring_virtqueue *vq =3D to_vvq(_vq);
> > > +   struct virtio_device *vdev =3D _vq->vdev;
> > > +   int err;
> > > +
> > > +   err =3D vring_alloc_queue_split(&vring_split, vdev, num,
> > > +                                 vq->split.vring_align,
> > > +                                 vq->split.may_reduce_num);
> > > +   if (err)
> > > +           goto err;
> >
> >
> > I think we don't need to do anything here?
>
> Am I missing something?

I meant it looks to me most of the virtqueue_reinit() is unnecessary.
We probably only need to reinit avail/used idx there.

Thanks

>
> >
> >
> > > +
> > > +   err =3D vring_alloc_state_extra_split(&vring_split);
> > > +   if (err) {
> > > +           vring_free_split(&vring_split, vdev);
> > > +           goto err;
> >
> >
> > I suggest to move vring_free_split() into a dedicated error label.
>
> Will change.
>
> Thanks.
>
>
> >
> > Thanks
> >
> >
> > > +   }
> > > +
> > > +   vring_free(&vq->vq);
> > > +
> > > +   virtqueue_vring_init_split(&vring_split, vq);
> > > +
> > > +   virtqueue_init(vq, vring_split.vring.num);
> > > +   virtqueue_vring_attach_split(vq, &vring_split);
> > > +
> > > +   return 0;
> > > +
> > > +err:
> > > +   virtqueue_reinit_split(vq);
> > > +   return -ENOMEM;
> > > +}
> > > +
> > >
> > >   /*
> > >    * Packed ring specific functions - *_packed().
> >
>

