Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40F2B4D28D3
	for <lists+linux-remoteproc@lfdr.de>; Wed,  9 Mar 2022 07:15:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbiCIGP4 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 9 Mar 2022 01:15:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbiCIGPw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 9 Mar 2022 01:15:52 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7FC281617C8
        for <linux-remoteproc@vger.kernel.org>; Tue,  8 Mar 2022 22:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646806489;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ap6RrdGHmNkYVL8OAqPmtOOXTX9dVLo0fsotyLbFTFg=;
        b=d2TS+Hy3FBoYz64XltSspcIpJWbwAC2ceQBa1WhCut1XhLf2CwlmhE4M++pkDhm0UIFpCP
        I4ZWvLZElMPgv9qWPmjKov/XepoiyawFm8s5YxYqoH05FjHMxnmC3QijkDe6yKg44kkowK
        DBtgdHLM4Hyw8uG+gNgljUQSriL7Lfs=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206-oFy724mKOQaJl00HCqYB0w-1; Wed, 09 Mar 2022 01:14:48 -0500
X-MC-Unique: oFy724mKOQaJl00HCqYB0w-1
Received: by mail-pf1-f200.google.com with SMTP id k130-20020a628488000000b004f362b45f28so979755pfd.9
        for <linux-remoteproc@vger.kernel.org>; Tue, 08 Mar 2022 22:14:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Ap6RrdGHmNkYVL8OAqPmtOOXTX9dVLo0fsotyLbFTFg=;
        b=ncDfx4pu6QkL7YWk3s1pol0uvR6cCxUEbkuF1KFecQTXk7wauFtDYiEzcssrUSRMYo
         aaiSG7Pf9GjbAf0NKsJ1lC7kFZNB8VYyTFsHuJzrPNug1BiuyVDvq7+1mY5Kork3eSpn
         Z4UO6h3T9A29TCu5WIIEeIRr6QRZ30OKwQnIZ/nknd/Iu4f4P0Nn0EvrtEnSbMrfPZfq
         EWqfsNLhDDnaFolz4IdAKTLd1270YHVgLxcXyVL6UYXRC7JnUL7oG86/9Vr/lqaoX59V
         3DG/acbLsQCUL1XqfzLYVcozhOJH2e3z7uqHN2qe7SCipaEWVYW/qShjX8N/KYi0Aicm
         6gBg==
X-Gm-Message-State: AOAM5318DPy4A0K9jgjpqn+H5gFhiAc3oHSpk9veEBheG8yTX8BXSOzo
        h2HgVv3L127B7sjUwv/OFSWAJNmy1/gd/NMBEx2sytbCTBR3HCehY+xP93BsElI0KHVesfI4aRq
        4IzoFGgqxKaB6AoNHY7ifDHOxdc1K2Q==
X-Received: by 2002:a17:903:22cb:b0:151:9f41:8738 with SMTP id y11-20020a17090322cb00b001519f418738mr21847646plg.46.1646806487030;
        Tue, 08 Mar 2022 22:14:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyBCiRie4tAloFgqDg9JGwKT4KtqZzw2Fk+Xq44JLOLrxTAEP8NZVRRnFNWgW3q7UR+lbtsrg==
X-Received: by 2002:a17:903:22cb:b0:151:9f41:8738 with SMTP id y11-20020a17090322cb00b001519f418738mr21847626plg.46.1646806486782;
        Tue, 08 Mar 2022 22:14:46 -0800 (PST)
Received: from [10.72.12.183] ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id v14-20020a056a00148e00b004e1cee6f6b4sm1233248pfu.47.2022.03.08.22.14.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Mar 2022 22:14:46 -0800 (PST)
Message-ID: <4bc140fa-9e72-4bb5-47d9-84d9db384898@redhat.com>
Date:   Wed, 9 Mar 2022 14:14:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v7 02/26] virtio: queue_reset: add VIRTIO_F_RING_RESET
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
 <20220308123518.33800-3-xuanzhuo@linux.alibaba.com>
From:   Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220308123518.33800-3-xuanzhuo@linux.alibaba.com>
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


在 2022/3/8 下午8:34, Xuan Zhuo 写道:
> Added VIRTIO_F_RING_RESET, it came from here
> https://github.com/oasis-tcs/virtio-spec/issues/124


Nit: it's better to explain VIRTIO_F_RING_RESET a little bit here.

Other than this.

Acked-by: Jason Wang <jasowang@redhat.com>


>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>   include/uapi/linux/virtio_config.h | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/include/uapi/linux/virtio_config.h b/include/uapi/linux/virtio_config.h
> index b5eda06f0d57..0862be802ff8 100644
> --- a/include/uapi/linux/virtio_config.h
> +++ b/include/uapi/linux/virtio_config.h
> @@ -52,7 +52,7 @@
>    * rest are per-device feature bits.
>    */
>   #define VIRTIO_TRANSPORT_F_START	28
> -#define VIRTIO_TRANSPORT_F_END		38
> +#define VIRTIO_TRANSPORT_F_END		41
>   
>   #ifndef VIRTIO_CONFIG_NO_LEGACY
>   /* Do we get callbacks when the ring is completely used, even if we've
> @@ -92,4 +92,9 @@
>    * Does the device support Single Root I/O Virtualization?
>    */
>   #define VIRTIO_F_SR_IOV			37
> +
> +/*
> + * This feature indicates that the driver can reset a queue individually.
> + */
> +#define VIRTIO_F_RING_RESET		40
>   #endif /* _UAPI_LINUX_VIRTIO_CONFIG_H */

