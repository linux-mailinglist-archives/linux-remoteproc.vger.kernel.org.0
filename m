Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D786A561299
	for <lists+linux-remoteproc@lfdr.de>; Thu, 30 Jun 2022 08:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232588AbiF3Gj3 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 30 Jun 2022 02:39:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232227AbiF3GjZ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 30 Jun 2022 02:39:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DC1492F642
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 Jun 2022 23:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656571163;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pJ9PIxLLsVzCuVJJtdE0cxnl/Cjc0vCs0BsaA2nNYcE=;
        b=TNNrSJTOZQYjZsv36hTEYZJPqKF4mpbbauDByfQylHs3Wb/2OjmpDX9tv4UKCzdLqpv2sT
        4zzzEm+aH8nQUqhq+A/u6wuaHA1vQwRopXZ4htilDl7/NlkP8einMf6dxxAAWhf6XDsTpo
        rJezdjHB+ZLKesVzzGB3RXPrGCjMc0Q=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-404-qDrD157uNly3A09X_RZDxg-1; Thu, 30 Jun 2022 02:39:21 -0400
X-MC-Unique: qDrD157uNly3A09X_RZDxg-1
Received: by mail-lf1-f69.google.com with SMTP id z13-20020a056512308d00b004811694f893so5658459lfd.6
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 Jun 2022 23:39:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pJ9PIxLLsVzCuVJJtdE0cxnl/Cjc0vCs0BsaA2nNYcE=;
        b=lnmn0aWMt8aO9rMaX6c3qBwCHr9yRHyuOoo9ZJXumxgFoSZDn9YyGxQBa4oVqGxgzj
         WSYzYzZGjTG2oWZfnxB0tUOg88um6Cs7nccd3DKnBKqTKdk833Nnola5vw5PejYuTVBr
         GtFXLJt5sNYoug0HwrqkObKSnyQgvRmVeMusfpF+1GDJPXF2cy72y+O251mL0wBcLjcg
         VRaWBi383Rc9NiP89HJn1/LkrqL/qWsiflFlh8jM0zNATtppKtfQs2RS2saAa9P+0ieU
         SZhSB6XoIbuUkXyrSDBD0GOYKJCyUB5errdOi+fDG7n+g6toivfZDf/Av+GGXl1a96+w
         Rcrw==
X-Gm-Message-State: AJIora85QOkfsvRlnCRCOaOGDlYGKJc+BkDjHPVhfgiSyI9t1PlCnrm3
        eJCzBviXv/LlQ6nyRk0MmkYp5s7usJQtnWcmbhT1BoRthbuTRbgPRRodk3vuC//DK7WEbP/fukk
        t+p3jYlOJE2YNZVAXzUKfgE3mntbLZ0L9/uGuIO/xL0NVBg==
X-Received: by 2002:a05:6512:3f0f:b0:47f:6f89:326 with SMTP id y15-20020a0565123f0f00b0047f6f890326mr4440379lfa.124.1656571159810;
        Wed, 29 Jun 2022 23:39:19 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tqG3rBVpPZppnWzT9+UoAeK5eCUmyrl/4NUFplfIBffY69P4EaE37IkoiuXbBcVcsUA6aouX0dtgCqbLTS49I=
X-Received: by 2002:a05:6512:3f0f:b0:47f:6f89:326 with SMTP id
 y15-20020a0565123f0f00b0047f6f890326mr4440343lfa.124.1656571159618; Wed, 29
 Jun 2022 23:39:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220629065656.54420-1-xuanzhuo@linux.alibaba.com> <20220629065656.54420-3-xuanzhuo@linux.alibaba.com>
In-Reply-To: <20220629065656.54420-3-xuanzhuo@linux.alibaba.com>
From:   Jason Wang <jasowang@redhat.com>
Date:   Thu, 30 Jun 2022 14:39:08 +0800
Message-ID: <CACGkMEuM3rZwQ8dKUQovwpf+JVvp53SY=2ANVeKw746e3o0_xg@mail.gmail.com>
Subject: Re: [PATCH v11 02/40] virtio: struct virtio_config_ops add callbacks
 for queue_reset
To:     Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc:     virtualization <virtualization@lists.linux-foundation.org>,
        Richard Weinberger <richard@nod.at>,
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
        kangjie.xu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Jun 29, 2022 at 2:57 PM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
>
> reset can be divided into the following four steps (example):
>  1. transport: notify the device to reset the queue
>  2. vring:     recycle the buffer submitted
>  3. vring:     reset/resize the vring (may re-alloc)
>  4. transport: mmap vring to device, and enable the queue
>
> In order to support queue reset, add two callbacks(reset_vq,
> enable_reset_vq) in struct virtio_config_ops to implement steps 1 and 4.
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>  include/linux/virtio_config.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
> index b47c2e7ed0ee..ded51b0d4823 100644
> --- a/include/linux/virtio_config.h
> +++ b/include/linux/virtio_config.h
> @@ -78,6 +78,16 @@ struct virtio_shm_region {
>   * @set_vq_affinity: set the affinity for a virtqueue (optional).
>   * @get_vq_affinity: get the affinity for a virtqueue (optional).
>   * @get_shm_region: get a shared memory region based on the index.
> + * @reset_vq: reset a queue individually (optional).
> + *     vq: the virtqueue
> + *     Returns 0 on success or error status
> + *     reset_vq will guarantee that the callbacks are disabled and synchronized.
> + *     Except for the callback, the caller should guarantee that the vring is
> + *     not accessed by any functions of virtqueue.
> + * @enable_reset_vq: enable a reset queue
> + *     vq: the virtqueue
> + *     Returns 0 on success or error status
> + *     If reset_vq is set, then enable_reset_vq must also be set.
>   */
>  typedef void vq_callback_t(struct virtqueue *);
>  struct virtio_config_ops {
> @@ -104,6 +114,8 @@ struct virtio_config_ops {
>                         int index);
>         bool (*get_shm_region)(struct virtio_device *vdev,
>                                struct virtio_shm_region *region, u8 id);
> +       int (*reset_vq)(struct virtqueue *vq);
> +       int (*enable_reset_vq)(struct virtqueue *vq);

I wonder if a single op with a boolean parameter is sufficient here.

Thanks

>  };
>
>  /* If driver didn't advertise the feature, it will never appear. */
> --
> 2.31.0
>

