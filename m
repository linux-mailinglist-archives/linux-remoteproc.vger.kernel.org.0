Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C14E57C78A
	for <lists+linux-remoteproc@lfdr.de>; Thu, 21 Jul 2022 11:26:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232559AbiGUJ0Y (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 21 Jul 2022 05:26:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231128AbiGUJ0X (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 21 Jul 2022 05:26:23 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7583E77574
        for <linux-remoteproc@vger.kernel.org>; Thu, 21 Jul 2022 02:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658395580;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pxqVBZnZmkgOHYwiYGXPDu4uhyKliCc2cAcObS0C01w=;
        b=bb7fqamyHS9GFmq8uDAqWQwb3iJWNvxV9yoq01Smrxkx/x6QUiQDKZ7fHM9p+QCb82ouby
        9KFPRl6THFvmGU9gCQ2KedVChMpYy2Nu4mIVAfHqY9nBG1GCKzmM7QJ0CYeqFF12jIs6xj
        efsJ5tdAHnrnH7/6H1vKQ1QijtDM84k=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-338-N_OzWF3TO4qW6ZLcAvUQgQ-1; Thu, 21 Jul 2022 05:26:19 -0400
X-MC-Unique: N_OzWF3TO4qW6ZLcAvUQgQ-1
Received: by mail-pj1-f72.google.com with SMTP id o21-20020a17090a9f9500b001f0574225faso2562962pjp.6
        for <linux-remoteproc@vger.kernel.org>; Thu, 21 Jul 2022 02:26:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pxqVBZnZmkgOHYwiYGXPDu4uhyKliCc2cAcObS0C01w=;
        b=s7I1mTw+wlnE9P+rrGfFhMypV3QFDuVdCeVmIzcF4KR/2uX37igmv80IDvc8bH6y5K
         Wmco8sSxz7GamaEG0DrD0CrAonhvOuWic+ige9swZK5iikuHCgJ7Z5DmPmkXa/4x4ewb
         laMGvv2slNJXGCikj6yTN7GAOt4MxJbRwb/QavUWsKVeW9Z6OKdcgWfOHorGuL0m5ypO
         fMPAEf+aqEhXEJTSeBSfMQCNW1iNxUFLeG53ARPdh4YEYDMpH2btgZ9e8MSVPADmVhgn
         EcJsnkWdgBBBD4XItXIa788c/c0fnMmhNKGn1Tm3hMPZra8ZoUldqj3U6BA5qlguJy0E
         Y4NQ==
X-Gm-Message-State: AJIora8IPor9dsZ913h5yacBmJwqC23ccNSY/GLSbCfKZE6ZOeQ6N8Fo
        mDK/CmrhibXAy+g6r5xd9BLz7S155pTTNp210qtk0CpiVjMF2X496/4p7nWi8lnR80B1dFHHMZU
        vyx1ncEtaO1J2BJNkcTBsmL4+ITB6sg==
X-Received: by 2002:a17:90a:f481:b0:1f2:43c:a61 with SMTP id bx1-20020a17090af48100b001f2043c0a61mr10625061pjb.134.1658395578169;
        Thu, 21 Jul 2022 02:26:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sVEm7Oz/22bKmKW2lh3GmJtdU5mssFIrGu+0Tisk4DP+fMNvbSDHGVBHUYgonKpLqTeG+uag==
X-Received: by 2002:a17:90a:f481:b0:1f2:43c:a61 with SMTP id bx1-20020a17090af48100b001f2043c0a61mr10625043pjb.134.1658395577872;
        Thu, 21 Jul 2022 02:26:17 -0700 (PDT)
Received: from [10.72.12.47] ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id l28-20020a635b5c000000b0041a411823d4sm1036080pgm.22.2022.07.21.02.26.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 02:26:17 -0700 (PDT)
Message-ID: <726a5056-789a-b445-a2c6-879008ad270a@redhat.com>
Date:   Thu, 21 Jul 2022 17:25:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v12 38/40] virtio_net: support rx queue resize
Content-Language: en-US
To:     Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        virtualization@lists.linux-foundation.org
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
        linux-um@lists.infradead.org, netdev@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
        kvm@vger.kernel.org, bpf@vger.kernel.org,
        kangjie.xu@linux.alibaba.com
References: <20220720030436.79520-1-xuanzhuo@linux.alibaba.com>
 <20220720030436.79520-39-xuanzhuo@linux.alibaba.com>
From:   Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220720030436.79520-39-xuanzhuo@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


在 2022/7/20 11:04, Xuan Zhuo 写道:
> This patch implements the resize function of the rx queues.
> Based on this function, it is possible to modify the ring num of the
> queue.
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>   drivers/net/virtio_net.c | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
>
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index fe4dc43c05a1..1115a8b59a08 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -278,6 +278,8 @@ struct padded_vnet_hdr {
>   	char padding[12];
>   };
>   
> +static void virtnet_rq_free_unused_buf(struct virtqueue *vq, void *buf);
> +
>   static bool is_xdp_frame(void *ptr)
>   {
>   	return (unsigned long)ptr & VIRTIO_XDP_FLAG;
> @@ -1846,6 +1848,26 @@ static netdev_tx_t start_xmit(struct sk_buff *skb, struct net_device *dev)
>   	return NETDEV_TX_OK;
>   }
>   
> +static int virtnet_rx_resize(struct virtnet_info *vi,
> +			     struct receive_queue *rq, u32 ring_num)
> +{
> +	int err, qindex;
> +
> +	qindex = rq - vi->rq;
> +
> +	napi_disable(&rq->napi);


We need to disable refill work as well. So this series might need 
rebasing on top of

https://lore.kernel.org/netdev/20220704074859.16912-1-jasowang@redhat.com/

I will send a new version (probably tomorrow).

Thanks


> +
> +	err = virtqueue_resize(rq->vq, ring_num, virtnet_rq_free_unused_buf);
> +	if (err)
> +		netdev_err(vi->dev, "resize rx fail: rx queue index: %d err: %d\n", qindex, err);
> +
> +	if (!try_fill_recv(vi, rq, GFP_KERNEL))
> +		schedule_delayed_work(&vi->refill, 0);
> +
> +	virtnet_napi_enable(rq->vq, &rq->napi);
> +	return err;
> +}
> +
>   /*
>    * Send command via the control virtqueue and check status.  Commands
>    * supported by the hypervisor, as indicated by feature bits, should

