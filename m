Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D2B955C51B
	for <lists+linux-remoteproc@lfdr.de>; Tue, 28 Jun 2022 14:50:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236321AbiF1GHu (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 28 Jun 2022 02:07:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245326AbiF1GHr (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 28 Jun 2022 02:07:47 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9E6E1255BC
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jun 2022 23:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656396465;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=KUT1KDRsQCbghYqw5mAjvKAipnK8+qvq4+LEkef6mwI=;
        b=iB6znt4H688PphAGbSHAvsgZ/poCCE8apcMrySSDm/uG7ZW12pofVASbxnChNSYaQE+4/2
        XyYaz3+qGUu3X1n0sx3SWTXwcHwPyHH8zZKNpNYyRQh/hbKaGe3Xs1EiYpJPQhdFP4PQ/F
        Cs5cmSCRin0eojzxj6iJwUTSSHQ59gE=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-eprkHO3FM66yXWAJvFz-AQ-1; Tue, 28 Jun 2022 02:07:41 -0400
X-MC-Unique: eprkHO3FM66yXWAJvFz-AQ-1
Received: by mail-lf1-f70.google.com with SMTP id cf10-20020a056512280a00b0047f5a295656so5770124lfb.15
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jun 2022 23:07:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KUT1KDRsQCbghYqw5mAjvKAipnK8+qvq4+LEkef6mwI=;
        b=Y8E+LrfFY2N93MIesDDQWNtL5KqQSwaKu64atx4t2Q+fJ/dUyOhZh4k33Taj/j39VR
         BXrQ4qToTKE/3+GYWUxCgpyqbLnF/ZfCBSBTa7kAhGtKoI3lsq4hikEoLF/D11YFs6pz
         A8kdu0SVgVHKPqBvyqh/BzpyAhp/zfHBWThYFJbTnSw+eDOKvibNsmwkWG8gjBljQjbG
         jL2z7vRYwMMo4mGG6Sd9rWHY92dbPvQ9M04QEsFEGsULzWMSbYwhXQLcvaS5JQoOe5n2
         +5asEePCfHwFHGhHgpBnEdP0gymfuWzxbUGUwgqqL4feMnFaiFTfETsKDXVZ7S7CaWW9
         wBwg==
X-Gm-Message-State: AJIora9nDivbf7nsIdFkJF5jAyc7jjmcI6Dd3Ba2b2nqG3L2QvdHaFcm
        1YtjkKW2qnrwoA/ftuR8SvZmU7WyzNBBrctqux1SAJobnqZzpQDWEUhHqSbmg+AyewKPvV/spVg
        m+OrExGejalyOlvwJPG046AxrQTrWLMBrad5JKoD2AuCWTA==
X-Received: by 2002:a05:651c:895:b0:250:c5ec:bc89 with SMTP id d21-20020a05651c089500b00250c5ecbc89mr8315146ljq.251.1656396460162;
        Mon, 27 Jun 2022 23:07:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uv1ZBawh+P9oWSPBH26qPWCIYjS9uNve6lqad17cW1vkQvItG6ZzBL6RQ0GxzhIXXq3N271R2bfg7ykwVXyRw=
X-Received: by 2002:a05:651c:895:b0:250:c5ec:bc89 with SMTP id
 d21-20020a05651c089500b00250c5ecbc89mr8315105ljq.251.1656396459820; Mon, 27
 Jun 2022 23:07:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220624025621.128843-1-xuanzhuo@linux.alibaba.com>
 <20220624025621.128843-26-xuanzhuo@linux.alibaba.com> <20220624025817-mutt-send-email-mst@kernel.org>
 <CACGkMEseptD=45j3kQr0yciRxR679Jcig=292H07-RYC2vXmFQ@mail.gmail.com>
 <20220627023841-mutt-send-email-mst@kernel.org> <CACGkMEvy8xF2T_vubKeUEPC2aroO_fbB0Xe8nnxK4OBUgAS+Gw@mail.gmail.com>
 <20220627034733-mutt-send-email-mst@kernel.org> <CACGkMEtpjUBaUML=fEs5hR66rzNTBhBXOmfpzyXV1F-6BqvsGg@mail.gmail.com>
 <20220627074723-mutt-send-email-mst@kernel.org> <CACGkMEv0zdgG6SAaxRwkpObEFX_KRB1ovezNiHX+QXsYhE=qaQ@mail.gmail.com>
 <20220628014309-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220628014309-mutt-send-email-mst@kernel.org>
From:   Jason Wang <jasowang@redhat.com>
Date:   Tue, 28 Jun 2022 14:07:28 +0800
Message-ID: <CACGkMEuzrmVsM5Xa3N_9n0-XOqyMAz65AON8oxkgmjnXb_bAFg@mail.gmail.com>
Subject: Re: [PATCH v10 25/41] virtio_pci: struct virtio_pci_common_cfg add queue_notify_data
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        virtualization <virtualization@lists.linux-foundation.org>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
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
        kangjie.xu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Jun 28, 2022 at 1:46 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Jun 28, 2022 at 11:50:37AM +0800, Jason Wang wrote:
> > On Mon, Jun 27, 2022 at 7:53 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Mon, Jun 27, 2022 at 04:14:20PM +0800, Jason Wang wrote:
> > > > On Mon, Jun 27, 2022 at 3:58 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > >
> > > > > On Mon, Jun 27, 2022 at 03:45:30PM +0800, Jason Wang wrote:
> > > > > > On Mon, Jun 27, 2022 at 2:39 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > > >
> > > > > > > On Mon, Jun 27, 2022 at 10:30:42AM +0800, Jason Wang wrote:
> > > > > > > > On Fri, Jun 24, 2022 at 2:59 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > > > > >
> > > > > > > > > On Fri, Jun 24, 2022 at 10:56:05AM +0800, Xuan Zhuo wrote:
> > > > > > > > > > Add queue_notify_data in struct virtio_pci_common_cfg, which comes from
> > > > > > > > > > here https://github.com/oasis-tcs/virtio-spec/issues/89
> > > > > > > > > >
> > > > > > > > > > For not breaks uABI, add a new struct virtio_pci_common_cfg_notify.
> > > > > > > > >
> > > > > > > > > What exactly is meant by not breaking uABI?
> > > > > > > > > Users are supposed to be prepared for struct size to change ... no?
> > > > > > > >
> > > > > > > > Not sure, any doc for this?
> > > > > > > >
> > > > > > > > Thanks
> > > > > > >
> > > > > > >
> > > > > > > Well we have this:
> > > > > > >
> > > > > > >         The drivers SHOULD only map part of configuration structure
> > > > > > >         large enough for device operation.  The drivers MUST handle
> > > > > > >         an unexpectedly large \field{length}, but MAY check that \field{length}
> > > > > > >         is large enough for device operation.
> > > > > >
> > > > > > Yes, but that's the device/driver interface. What's done here is the
> > > > > > userspace/kernel.
> > > > > >
> > > > > > Userspace may break if it uses e.g sizeof(struct virtio_pci_common_cfg)?
> > > > > >
> > > > > > Thanks
> > > > >
> > > > > Hmm I guess there's risk... but then how are we going to maintain this
> > > > > going forward?  Add a new struct on any change?
> > > >
> > > > This is the way we have used it for the past 5 or more years. I don't
> > > > see why this must be handled in the vq reset feature.
> > > >
> > > > >Can we at least
> > > > > prevent this going forward somehow?
> > > >
> > > > Like have some padding?
> > > >
> > > > Thanks
> > >
> > > Maybe - this is what QEMU does ...
> >
> > Do you want this to be addressed in this series (it's already very huge anyhow)?
> >
> > Thanks
>
> Let's come up with a solution at least. QEMU does not seem to need the struct.

If we want to implement it in Qemu we need that:

https://github.com/fengidri/qemu/commit/39b79335cb55144d11a3b01f93d46cc73342c6bb

> Let's just put
> it in virtio_pci_modern.h for now then?

Does this mean userspace needs to define the struct by their own
instead of depending on the uapi in the future?

Thanks

>
> > >
> > > > >
> > > > >
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > > Since I want to add queue_reset after queue_notify_data, I submitted
> > > > > > > > > > this patch first.
> > > > > > > > > >
> > > > > > > > > > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > > > > > > > > Acked-by: Jason Wang <jasowang@redhat.com>
> > > > > > > > > > ---
> > > > > > > > > >  include/uapi/linux/virtio_pci.h | 7 +++++++
> > > > > > > > > >  1 file changed, 7 insertions(+)
> > > > > > > > > >
> > > > > > > > > > diff --git a/include/uapi/linux/virtio_pci.h b/include/uapi/linux/virtio_pci.h
> > > > > > > > > > index 3a86f36d7e3d..22bec9bd0dfc 100644
> > > > > > > > > > --- a/include/uapi/linux/virtio_pci.h
> > > > > > > > > > +++ b/include/uapi/linux/virtio_pci.h
> > > > > > > > > > @@ -166,6 +166,13 @@ struct virtio_pci_common_cfg {
> > > > > > > > > >       __le32 queue_used_hi;           /* read-write */
> > > > > > > > > >  };
> > > > > > > > > >
> > > > > > > > > > +struct virtio_pci_common_cfg_notify {
> > > > > > > > > > +     struct virtio_pci_common_cfg cfg;
> > > > > > > > > > +
> > > > > > > > > > +     __le16 queue_notify_data;       /* read-write */
> > > > > > > > > > +     __le16 padding;
> > > > > > > > > > +};
> > > > > > > > > > +
> > > > > > > > > >  /* Fields in VIRTIO_PCI_CAP_PCI_CFG: */
> > > > > > > > > >  struct virtio_pci_cfg_cap {
> > > > > > > > > >       struct virtio_pci_cap cap;
> > > > > > > > > > --
> > > > > > > > > > 2.31.0
> > > > > > > > >
> > > > > > >
> > > > >
> > >
>

