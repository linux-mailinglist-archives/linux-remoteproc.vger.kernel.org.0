Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84DD4563006
	for <lists+linux-remoteproc@lfdr.de>; Fri,  1 Jul 2022 11:28:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233214AbiGAJ2L (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 1 Jul 2022 05:28:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235360AbiGAJ2E (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 1 Jul 2022 05:28:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3C444C31
        for <linux-remoteproc@vger.kernel.org>; Fri,  1 Jul 2022 02:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656667682;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZBQdYZv/rBFNAXGUnNhg85FJcoNaGILlYzbcDNSwkmw=;
        b=A9doN6LdQGyTto522TWaPK0RQA6ELp5amqoMXKw4uB1ymomdov9Rc52ybj2SoHluTvz9bV
        r0+jcRSGmZ2AwJHB3QTY1EjcLTR1ullNZVvRkL1OrJLBwsn83oa7NG4xmddN7EOcPIRh0a
        iz3SA80u6KqaFeoMnd2PePZTtlnVmzM=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-AAvDpfSJNC-qDHvpwFQNFA-1; Fri, 01 Jul 2022 05:28:01 -0400
X-MC-Unique: AAvDpfSJNC-qDHvpwFQNFA-1
Received: by mail-pl1-f198.google.com with SMTP id l16-20020a170903121000b0016a64bbe81cso1208357plh.11
        for <linux-remoteproc@vger.kernel.org>; Fri, 01 Jul 2022 02:28:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZBQdYZv/rBFNAXGUnNhg85FJcoNaGILlYzbcDNSwkmw=;
        b=eT6AQnonnQPXIbsE/nsirjsOt7iuoEmUNRit4REonsp5+IHoYrTLuQH0utZSF0H7qY
         3OHVa4mnBi1v0RS2Fw8/czjaURec8r8bV48k05HZqqumePQSw10XFBhIRYlCZNquW00P
         AT+DnvClpXhuxKn8IEWmJbF4hYDYslrVkL3/nXIajAQxMhgI9LggiVoi9Omt32xGTJDG
         1IUmBICUVPcCTnVA2KauyPdoxel8k2fklvHIus00s1jeu3JWUqQ0rP64h8WxhAR3NIip
         YTDEMVwJ2jHIvVIu6fymBSFSCwxpdH6f12WYt2BHTkd78bHRROk57I/HiFV37gSlIeH0
         Bqnw==
X-Gm-Message-State: AJIora+BNoNvkiou5nFOFMP2UaF8DC1AsFneCeR22i+tZezVamw6ai0j
        wWr+95ti4mP21/fEm85kDefLJvB9hHWGkrZp2UOZJoG4eJzaF2J17eNoq3ztF1yRv67parHnPm7
        utvln9IXvvJYysJU/nBT+6B3M+LTQKw==
X-Received: by 2002:a17:90b:3141:b0:1ed:4ffb:f911 with SMTP id ip1-20020a17090b314100b001ed4ffbf911mr17631432pjb.80.1656667679997;
        Fri, 01 Jul 2022 02:27:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v7wu5Pr52fEWhoICBbqVrBx5u9VuzueVx4HVEs9nrjbr1aixGJWRwEIuEt0pnr6Hnq0W2LoA==
X-Received: by 2002:a17:90b:3141:b0:1ed:4ffb:f911 with SMTP id ip1-20020a17090b314100b001ed4ffbf911mr17631389pjb.80.1656667679758;
        Fri, 01 Jul 2022 02:27:59 -0700 (PDT)
Received: from [10.72.13.237] ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id a9-20020aa79709000000b00528208d3056sm1775809pfg.64.2022.07.01.02.27.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Jul 2022 02:27:59 -0700 (PDT)
Message-ID: <de7cf56d-acbd-1a2b-2226-a9fdd89afb78@redhat.com>
Date:   Fri, 1 Jul 2022 17:27:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v11 21/40] virtio_ring: packed: introduce
 virtqueue_resize_packed()
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
References: <20220629065656.54420-1-xuanzhuo@linux.alibaba.com>
 <20220629065656.54420-22-xuanzhuo@linux.alibaba.com>
From:   Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220629065656.54420-22-xuanzhuo@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


在 2022/6/29 14:56, Xuan Zhuo 写道:
> virtio ring packed supports resize.
>
> Only after the new vring is successfully allocated based on the new num,
> we will release the old vring. In any case, an error is returned,
> indicating that the vring still points to the old vring.
>
> In the case of an error, re-initialize(by virtqueue_reinit_packed()) the
> virtqueue to ensure that the vring can be used.
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>   drivers/virtio/virtio_ring.c | 29 +++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
>
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index 650f701a5480..4860787286db 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -2042,6 +2042,35 @@ static struct virtqueue *vring_create_virtqueue_packed(
>   	return NULL;
>   }
>   
> +static int virtqueue_resize_packed(struct virtqueue *_vq, u32 num)
> +{
> +	struct vring_virtqueue_packed vring = {};
> +	struct vring_virtqueue *vq = to_vvq(_vq);
> +	struct virtio_device *vdev = _vq->vdev;
> +	int err;
> +
> +	if (vring_alloc_queue_packed(&vring, vdev, num))
> +		goto err_ring;
> +
> +	err = vring_alloc_state_extra_packed(&vring);
> +	if (err)
> +		goto err_state_extra;
> +
> +	vring_free(&vq->vq);
> +
> +	virtqueue_init(vq, vring.vring.num);
> +	virtqueue_vring_attach_packed(vq, &vring);
> +	virtqueue_vring_init_packed(vq);
> +
> +	return 0;
> +
> +err_state_extra:
> +	vring_free_packed(&vring, vdev);
> +err_ring:
> +	virtqueue_reinit_packed(vq);


So desc_state and desc_extra has been freed vring_free_packed() when 
vring_alloc_state_extra_packed() fails. We might get use-after-free here?

Actually, I think for resize we need

1) detach old
2) allocate new
3) if 2) succeed, attach new otherwise attach old

This seems more clearer than the current logic?

Thanks


> +	return -ENOMEM;
> +}
> +
>   
>   /*
>    * Generic functions and exported symbols.

