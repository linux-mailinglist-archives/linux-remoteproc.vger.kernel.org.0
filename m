Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBC10581EFC
	for <lists+linux-remoteproc@lfdr.de>; Wed, 27 Jul 2022 06:35:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240314AbiG0Eff (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 27 Jul 2022 00:35:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240212AbiG0Efd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 27 Jul 2022 00:35:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id ACED5DE8B
        for <linux-remoteproc@vger.kernel.org>; Tue, 26 Jul 2022 21:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658896531;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4Nhmdd76VxuZywcj4ABrLti2+JKOVAikxn2IN6L8acM=;
        b=dgRTNSxhuFkV7YNGzVBVDTQKwFbBAV/jaFluy71WagnQS8IaRLJYgs3CA1NRb7X7q6wk62
        1NwdA91oL99Ezay9+Yo8dKObFk17QPtPoW+oc9Kf0VJK6zDFh/6wRZaGg3e0bmZU3K/s5A
        miArsWOBOoUjN+rhqJcWAmcXvTrSQoo=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-V442ccyyOUePe5--y4pNPQ-1; Wed, 27 Jul 2022 00:35:30 -0400
X-MC-Unique: V442ccyyOUePe5--y4pNPQ-1
Received: by mail-pj1-f71.google.com with SMTP id c14-20020a17090abf0e00b001f2096d876bso6720523pjs.4
        for <linux-remoteproc@vger.kernel.org>; Tue, 26 Jul 2022 21:35:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4Nhmdd76VxuZywcj4ABrLti2+JKOVAikxn2IN6L8acM=;
        b=Vl4kVceIqh1ev9xSp3B+5vG1K0gb12i6ntGhx7vFebwcFoAxSOSpm1Csau4VlTTRGg
         FRJBnTLlPhtq1Ra9GLNrQ5hw8wpN1XsyIsA3PmKkGH/dvm/fMQWApVoseBY/h/WY52Ch
         fb8Ax3uYLz6FdEdB026Slq+3idGwrTLHzwJ0rL1kxGGkXVNYYNCUq6j9CQZ38EAvT2KV
         JND3DggfAwy27iIFNMC77um3GrQjqiSknxN2qOTAQWqU1uNSLi3msYlt7P9l2L1aUmMs
         m69VfyNx1y+4bLmphQFK1zgq8qiHWS/7mC1ckVcdLCkSrTD8FTHm3rBZ0VMd2V8ggUk1
         GabA==
X-Gm-Message-State: AJIora9govi07gO4CJiOp40LA8YrD+jut9qAhcOFLsVKRy1MAWyrFACf
        29hmkn+A5Ca5ZdJdD8LH4HFu/wCfSFQ/K4BLvXhYA7xKAkAG/ULuuNAUsH5CHiN5zprKMrHHC/L
        1U5DyWNXczmAc6rUwfglHC9W1wR1dOA==
X-Received: by 2002:a17:90b:1d90:b0:1f2:5f47:ca6c with SMTP id pf16-20020a17090b1d9000b001f25f47ca6cmr2521223pjb.162.1658896528716;
        Tue, 26 Jul 2022 21:35:28 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sv66YMuYLn2D/TECwlGvVrDyp85rujIUbxh1LnRrYj8nx/VinuiyLNA/hwGDceqmYNtwAlaQ==
X-Received: by 2002:a17:90b:1d90:b0:1f2:5f47:ca6c with SMTP id pf16-20020a17090b1d9000b001f25f47ca6cmr2521196pjb.162.1658896528457;
        Tue, 26 Jul 2022 21:35:28 -0700 (PDT)
Received: from [10.72.12.96] ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id i17-20020a170902c95100b0016d9d729f0bsm2843421pla.135.2022.07.26.21.35.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 21:35:26 -0700 (PDT)
Message-ID: <7b33b166-785f-ef8a-153f-e0b1c3b7e23d@redhat.com>
Date:   Wed, 27 Jul 2022 12:35:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v13 22/42] virtio_ring: packed: introduce
 virtqueue_reinit_packed()
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
References: <20220726072225.19884-1-xuanzhuo@linux.alibaba.com>
 <20220726072225.19884-23-xuanzhuo@linux.alibaba.com>
From:   Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220726072225.19884-23-xuanzhuo@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


在 2022/7/26 15:22, Xuan Zhuo 写道:
> Introduce a function to initialize vq without allocating new ring,
> desc_state, desc_extra.
>
> Subsequent patches will call this function after reset vq to
> reinitialize vq.
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   drivers/virtio/virtio_ring.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index 00b18cf3b4d9..7d4c444b5a9d 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -1957,6 +1957,27 @@ static void virtqueue_vring_attach_packed(struct vring_virtqueue *vq,
>   	vq->packed = *vring_packed;
>   }
>   
> +static void virtqueue_reinit_packed(struct vring_virtqueue *vq)
> +{
> +	int size, i;
> +
> +	memset(vq->packed.vring.device, 0, vq->packed.event_size_in_bytes);
> +	memset(vq->packed.vring.driver, 0, vq->packed.event_size_in_bytes);
> +	memset(vq->packed.vring.desc, 0, vq->packed.ring_size_in_bytes);
> +
> +	size = sizeof(struct vring_desc_state_packed) * vq->packed.vring.num;
> +	memset(vq->packed.desc_state, 0, size);
> +
> +	size = sizeof(struct vring_desc_extra) * vq->packed.vring.num;
> +	memset(vq->packed.desc_extra, 0, size);
> +
> +	for (i = 0; i < vq->packed.vring.num - 1; i++)
> +		vq->packed.desc_extra[i].next = i + 1;
> +
> +	virtqueue_init(vq, vq->packed.vring.num);
> +	virtqueue_vring_init_packed(&vq->packed, !!vq->vq.callback);
> +}
> +
>   static struct virtqueue *vring_create_virtqueue_packed(
>   	unsigned int index,
>   	unsigned int num,

