Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE9094D2A2B
	for <lists+linux-remoteproc@lfdr.de>; Wed,  9 Mar 2022 09:00:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbiCIH7u (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 9 Mar 2022 02:59:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231250AbiCIH5h (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 9 Mar 2022 02:57:37 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2409A168091
        for <linux-remoteproc@vger.kernel.org>; Tue,  8 Mar 2022 23:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646812566;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nXuB3B5jDtB5OBhHstqyNyrujXVHiDK4qma1A4MbOm0=;
        b=Bs2vgeoFTJeiA/Xv0iuZS7ktCfeWz5pkq9DTEI/3kWiuGaJOdADr+rP8TEpthNbOckMqeA
        7RMwDNXz+XeZZ4+PueVMa1wV6MRuA98JKSM0gypBZw30kbrpU3IIvjxRKLYjDWRABTzx0T
        l+/KcVTsTTwyQ1ja8deHNn29mA3WlLo=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-OYzTO9BKPGeGBAuDMaLY9g-1; Wed, 09 Mar 2022 02:56:05 -0500
X-MC-Unique: OYzTO9BKPGeGBAuDMaLY9g-1
Received: by mail-pl1-f197.google.com with SMTP id x6-20020a1709029a4600b0014efe26b04fso739108plv.21
        for <linux-remoteproc@vger.kernel.org>; Tue, 08 Mar 2022 23:56:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nXuB3B5jDtB5OBhHstqyNyrujXVHiDK4qma1A4MbOm0=;
        b=CrIG9n4JPakIbrEXQbFBvPby9lS7+6owSlTRmYUxKnUnsluwkY6rwLuOrKr1YspIk8
         eklfcfllB4fCOHNsCadib+y1tmab22zq8rLP80l0zxniLfYfrNmE/v/fywKsS7HDX/K0
         HGiJjBYnMCgwwhNvrWlFHKnpPY6cZIm7COcy1GUXBOWc02x8z1jn68+mPCDLF5taaqHw
         McKxvjm6hpNv3/PtU/MjTaM7jwrX+EVPZmHP6xaH5jO0EeoFPQajoV4kMqTJt+Gfr+AT
         dSdMaMNSwe2v3h9zt6f0hRZRQ34HNW4V+8O2YbkHIWUNkqHjiWVYzlxhaAbzCx4B64Kt
         NMSQ==
X-Gm-Message-State: AOAM530869qglquckDIEvfSsOR9cM8ubXomn6yAvkvZtluPWwieTZ3jW
        FhpQml1a/REEc6fMac0LB8K05+NN+XFVLBuUVz4q2lzYuOzgXsEZJQnLIcmYns2pZCNgTlMSUQ5
        i0of/koHpBHelfeBtZh5o1SwZWeTcJw==
X-Received: by 2002:a17:903:32c4:b0:151:c6ae:e24b with SMTP id i4-20020a17090332c400b00151c6aee24bmr22112800plr.85.1646812563917;
        Tue, 08 Mar 2022 23:56:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJybDKg7kAlq7E11Ti35K1Cy6HiZbN5h1MuN+e0cBpBT9cOyctGw5IATTQsVpIPtETRU/6u7tg==
X-Received: by 2002:a17:903:32c4:b0:151:c6ae:e24b with SMTP id i4-20020a17090332c400b00151c6aee24bmr22112759plr.85.1646812563582;
        Tue, 08 Mar 2022 23:56:03 -0800 (PST)
Received: from [10.72.12.183] ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id bd10-20020a056a00278a00b004f6fe0f4cbasm1395974pfb.101.2022.03.08.23.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Mar 2022 23:56:03 -0800 (PST)
Message-ID: <512de020-b36e-8473-69c8-8b3925fbb6c1@redhat.com>
Date:   Wed, 9 Mar 2022 15:55:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v7 09/26] virtio_ring: split: implement
 virtqueue_reset_vring_split()
Content-Language: en-US
To:     Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
Cc:     Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Cornelia Huck <cohuck@redhat.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Johannes Berg <johannes.berg@intel.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        linux-um@lists.infradead.org, platform-driver-x86@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
        kvm@vger.kernel.org, bpf@vger.kernel.org
References: <20220308123518.33800-1-xuanzhuo@linux.alibaba.com>
 <20220308123518.33800-10-xuanzhuo@linux.alibaba.com>
From:   Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220308123518.33800-10-xuanzhuo@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


在 2022/3/8 下午8:35, Xuan Zhuo 写道:
> virtio ring supports reset.
>
> Queue reset is divided into several stages.
>
> 1. notify device queue reset
> 2. vring release
> 3. attach new vring
> 4. notify device queue re-enable
>
> After the first step is completed, the vring reset operation can be
> performed. If the newly set vring num does not change, then just reset
> the vq related value.
>
> Otherwise, the vring will be released and the vring will be reallocated.
> And the vring will be attached to the vq. If this process fails, the
> function will exit, and the state of the vq will be the vring release
> state. You can call this function again to reallocate the vring.
>
> In addition, vring_align, may_reduce_num are necessary for reallocating
> vring, so they are retained when creating vq.
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>   drivers/virtio/virtio_ring.c | 69 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 69 insertions(+)
>
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index e0422c04c903..148fb1fd3d5a 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -158,6 +158,12 @@ struct vring_virtqueue {
>   			/* DMA address and size information */
>   			dma_addr_t queue_dma_addr;
>   			size_t queue_size_in_bytes;
> +
> +			/* The parameters for creating vrings are reserved for
> +			 * creating new vrings when enabling reset queue.
> +			 */
> +			u32 vring_align;
> +			bool may_reduce_num;
>   		} split;
>   
>   		/* Available for packed ring */
> @@ -217,6 +223,12 @@ struct vring_virtqueue {
>   #endif
>   };
>   
> +static void vring_free(struct virtqueue *vq);
> +static void __vring_virtqueue_init_split(struct vring_virtqueue *vq,
> +					 struct virtio_device *vdev);
> +static int __vring_virtqueue_attach_split(struct vring_virtqueue *vq,
> +					  struct virtio_device *vdev,
> +					  struct vring vring);
>   
>   /*
>    * Helpers.
> @@ -1012,6 +1024,8 @@ static struct virtqueue *vring_create_virtqueue_split(
>   		return NULL;
>   	}
>   
> +	to_vvq(vq)->split.vring_align = vring_align;
> +	to_vvq(vq)->split.may_reduce_num = may_reduce_num;
>   	to_vvq(vq)->split.queue_dma_addr = vring.dma_addr;
>   	to_vvq(vq)->split.queue_size_in_bytes = vring.queue_size_in_bytes;
>   	to_vvq(vq)->we_own_ring = true;
> @@ -1019,6 +1033,59 @@ static struct virtqueue *vring_create_virtqueue_split(
>   	return vq;
>   }
>   
> +static int virtqueue_reset_vring_split(struct virtqueue *_vq, u32 num)
> +{


So what this function does is to resize the virtqueue actually, I 
suggest to rename it as virtqueue_resize_split().


> +	struct vring_virtqueue *vq = to_vvq(_vq);
> +	struct virtio_device *vdev = _vq->vdev;
> +	struct vring_split vring;
> +	int err;
> +
> +	if (num > _vq->num_max)
> +		return -E2BIG;
> +
> +	switch (vq->vq.reset) {
> +	case VIRTIO_VQ_RESET_STEP_NONE:
> +		return -ENOENT;
> +
> +	case VIRTIO_VQ_RESET_STEP_VRING_ATTACH:
> +	case VIRTIO_VQ_RESET_STEP_DEVICE:
> +		if (vq->split.vring.num == num || !num)
> +			break;
> +
> +		vring_free(_vq);
> +
> +		fallthrough;
> +
> +	case VIRTIO_VQ_RESET_STEP_VRING_RELEASE:
> +		if (!num)
> +			num = vq->split.vring.num;
> +
> +		err = vring_create_vring_split(&vring, vdev,
> +					       vq->split.vring_align,
> +					       vq->weak_barriers,
> +					       vq->split.may_reduce_num, num);
> +		if (err)
> +			return -ENOMEM;


We'd better need a safe fallback here like:

If we can't allocate new memory, we can keep using the current one. 
Otherwise an ethtool -G fail may make the device not usable.

This could be done by not freeing the old vring and virtqueue states 
until new is allocated.


> +
> +		err = __vring_virtqueue_attach_split(vq, vdev, vring.vring);
> +		if (err) {
> +			vring_free_queue(vdev, vring.queue_size_in_bytes,
> +					 vring.queue,
> +					 vring.dma_addr);
> +			return -ENOMEM;
> +		}
> +
> +		vq->split.queue_dma_addr = vring.dma_addr;
> +		vq->split.queue_size_in_bytes = vring.queue_size_in_bytes;
> +	}
> +
> +	__vring_virtqueue_init_split(vq, vdev);
> +	vq->we_own_ring = true;


This seems wrong, we have the transport (rproc/mlxtbf) that allocate the 
vring by themselves. I think we need to fail the resize for we_own_ring 
== false.

Thanks



> +	vq->vq.reset = VIRTIO_VQ_RESET_STEP_VRING_ATTACH;
> +
> +	return 0;
> +}
> +
>   
>   /*
>    * Packed ring specific functions - *_packed().
> @@ -2317,6 +2384,8 @@ static int __vring_virtqueue_attach_split(struct vring_virtqueue *vq,
>   static void __vring_virtqueue_init_split(struct vring_virtqueue *vq,
>   					 struct virtio_device *vdev)
>   {
> +	vq->vq.reset = VIRTIO_VQ_RESET_STEP_NONE;
> +
>   	vq->packed_ring = false;
>   	vq->we_own_ring = false;
>   	vq->broken = false;

