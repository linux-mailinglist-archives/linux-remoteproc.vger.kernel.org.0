Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74015583A31
	for <lists+linux-remoteproc@lfdr.de>; Thu, 28 Jul 2022 10:18:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235092AbiG1ISW (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 28 Jul 2022 04:18:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234999AbiG1IST (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 28 Jul 2022 04:18:19 -0400
Received: from out30-42.freemail.mail.aliyun.com (out30-42.freemail.mail.aliyun.com [115.124.30.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C9D55A2DE;
        Thu, 28 Jul 2022 01:18:15 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R721e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045168;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=36;SR=0;TI=SMTPD_---0VKefuGf_1658996289;
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com fp:SMTPD_---0VKefuGf_1658996289)
          by smtp.aliyun-inc.com;
          Thu, 28 Jul 2022 16:18:10 +0800
Message-ID: <1658995783.1026692-1-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH v13 16/42] virtio_ring: split: introduce virtqueue_resize_split()
Date:   Thu, 28 Jul 2022 16:09:43 +0800
From:   Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To:     Jason Wang <jasowang@redhat.com>
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
References: <20220726072225.19884-1-xuanzhuo@linux.alibaba.com>
 <20220726072225.19884-17-xuanzhuo@linux.alibaba.com>
 <15aa26f2-f8af-5dbd-f2b2-9270ad873412@redhat.com>
 <1658907413.1860468-2-xuanzhuo@linux.alibaba.com>
 <CACGkMEvxsOfiiaWWAR8P68GY1yfwgTvaAbHk1JF7pTw-o2k25w@mail.gmail.com>
 <1658992162.584327-1-xuanzhuo@linux.alibaba.com>
 <CACGkMEv-KYieHKXY_Qn0nfcnLMOSF=TowF5PwLKOxESL3KQ40Q@mail.gmail.com>
In-Reply-To: <CACGkMEv-KYieHKXY_Qn0nfcnLMOSF=TowF5PwLKOxESL3KQ40Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-9.9 required=5.0 tests=BAYES_00,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNPARSEABLE_RELAY,USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, 28 Jul 2022 15:42:50 +0800, Jason Wang <jasowang@redhat.com> wrote:
> On Thu, Jul 28, 2022 at 3:24 PM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wr=
ote:
> >
> > On Thu, 28 Jul 2022 10:38:51 +0800, Jason Wang <jasowang@redhat.com> wr=
ote:
> > > On Wed, Jul 27, 2022 at 3:44 PM Xuan Zhuo <xuanzhuo@linux.alibaba.com=
> wrote:
> > > >
> > > > On Wed, 27 Jul 2022 11:12:19 +0800, Jason Wang <jasowang@redhat.com=
> wrote:
> > > > >
> > > > > =E5=9C=A8 2022/7/26 15:21, Xuan Zhuo =E5=86=99=E9=81=93:
> > > > > > virtio ring split supports resize.
> > > > > >
> > > > > > Only after the new vring is successfully allocated based on the=
 new num,
> > > > > > we will release the old vring. In any case, an error is returne=
d,
> > > > > > indicating that the vring still points to the old vring.
> > > > > >
> > > > > > In the case of an error, re-initialize(virtqueue_reinit_split()=
) the
> > > > > > virtqueue to ensure that the vring can be used.
> > > > > >
> > > > > > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > > > > Acked-by: Jason Wang <jasowang@redhat.com>
> > > > > > ---
> > > > > >   drivers/virtio/virtio_ring.c | 34 +++++++++++++++++++++++++++=
+++++++
> > > > > >   1 file changed, 34 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virt=
io_ring.c
> > > > > > index b6fda91c8059..58355e1ac7d7 100644
> > > > > > --- a/drivers/virtio/virtio_ring.c
> > > > > > +++ b/drivers/virtio/virtio_ring.c
> > > > > > @@ -220,6 +220,7 @@ static struct virtqueue *__vring_new_virtqu=
eue(unsigned int index,
> > > > > >                                            void (*callback)(str=
uct virtqueue *),
> > > > > >                                            const char *name);
> > > > > >   static struct vring_desc_extra *vring_alloc_desc_extra(unsign=
ed int num);
> > > > > > +static void vring_free(struct virtqueue *_vq);
> > > > > >
> > > > > >   /*
> > > > > >    * Helpers.
> > > > > > @@ -1117,6 +1118,39 @@ static struct virtqueue *vring_create_vi=
rtqueue_split(
> > > > > >     return vq;
> > > > > >   }
> > > > > >
> > > > > > +static int virtqueue_resize_split(struct virtqueue *_vq, u32 n=
um)
> > > > > > +{
> > > > > > +   struct vring_virtqueue_split vring_split =3D {};
> > > > > > +   struct vring_virtqueue *vq =3D to_vvq(_vq);
> > > > > > +   struct virtio_device *vdev =3D _vq->vdev;
> > > > > > +   int err;
> > > > > > +
> > > > > > +   err =3D vring_alloc_queue_split(&vring_split, vdev, num,
> > > > > > +                                 vq->split.vring_align,
> > > > > > +                                 vq->split.may_reduce_num);
> > > > > > +   if (err)
> > > > > > +           goto err;
> > > > >
> > > > >
> > > > > I think we don't need to do anything here?
> > > >
> > > > Am I missing something?
> > >
> > > I meant it looks to me most of the virtqueue_reinit() is unnecessary.
> > > We probably only need to reinit avail/used idx there.
> >
> >
> > In this function, we can indeed remove some code.
> >
> > >       static void virtqueue_reinit_split(struct vring_virtqueue *vq)
> > >       {
> > >               int size, i;
> > >
> > >               memset(vq->split.vring.desc, 0, vq->split.queue_size_in=
_bytes);
> > >
> > >               size =3D sizeof(struct vring_desc_state_split) * vq->sp=
lit.vring.num;
> > >               memset(vq->split.desc_state, 0, size);
> > >
> > >               size =3D sizeof(struct vring_desc_extra) * vq->split.vr=
ing.num;
> > >               memset(vq->split.desc_extra, 0, size);
> >
> > These memsets can be removed, and theoretically it will not cause any
> > exceptions.
>
> Yes, otherwise we have bugs in detach_buf().
>
> >
> > >
> > >
> > >
> > >               for (i =3D 0; i < vq->split.vring.num - 1; i++)
> > >                       vq->split.desc_extra[i].next =3D i + 1;
> >
> > This can also be removed, but we need to record free_head that will bee=
n update
> > inside virtqueue_init().
>
> We can simply keep free_head unchanged? Otherwise it's a bug somewhere I =
guess.
>
>
> >
> > >
> > >               virtqueue_init(vq, vq->split.vring.num);
> >
> > There are some operations in this, which can also be skipped, such as s=
etting
> > use_dma_api. But I think calling this function directly will be more co=
nvenient
> > for maintenance.
>
> I don't see anything that is necessary here.

These three are currently inside virtqueue_init()

vq->last_used_idx =3D 0;
vq->event_triggered =3D false;
vq->num_added =3D 0;

Thanks.


>
> >
> >
> > >               virtqueue_vring_init_split(&vq->split, vq);
> >
> > virtqueue_vring_init_split() is necessary.
>
> Right.
>
> >
> > >       }
> >
> > Another method, we can take out all the variables to be reinitialized
> > separately, and repackage them into a new function. I don=E2=80=99t thi=
nk it=E2=80=99s worth
> > it, because this path will only be reached if the memory allocation fai=
ls, which
> > is a rare occurrence. In this case, doing so will increase the cost of
> > maintenance. If you think so also, I will remove the above memset in th=
e next
> > version.
>
> I agree.
>
> Thanks
>
> >
> > Thanks.
> >
> >
> > >
> > > Thanks
> > >
> > > >
> > > > >
> > > > >
> > > > > > +
> > > > > > +   err =3D vring_alloc_state_extra_split(&vring_split);
> > > > > > +   if (err) {
> > > > > > +           vring_free_split(&vring_split, vdev);
> > > > > > +           goto err;
> > > > >
> > > > >
> > > > > I suggest to move vring_free_split() into a dedicated error label.
> > > >
> > > > Will change.
> > > >
> > > > Thanks.
> > > >
> > > >
> > > > >
> > > > > Thanks
> > > > >
> > > > >
> > > > > > +   }
> > > > > > +
> > > > > > +   vring_free(&vq->vq);
> > > > > > +
> > > > > > +   virtqueue_vring_init_split(&vring_split, vq);
> > > > > > +
> > > > > > +   virtqueue_init(vq, vring_split.vring.num);
> > > > > > +   virtqueue_vring_attach_split(vq, &vring_split);
> > > > > > +
> > > > > > +   return 0;
> > > > > > +
> > > > > > +err:
> > > > > > +   virtqueue_reinit_split(vq);
> > > > > > +   return -ENOMEM;
> > > > > > +}
> > > > > > +
> > > > > >
> > > > > >   /*
> > > > > >    * Packed ring specific functions - *_packed().
> > > > >
> > > >
> > >
> >
>
