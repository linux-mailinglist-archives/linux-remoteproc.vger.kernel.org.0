Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E172442BE7D
	for <lists+linux-remoteproc@lfdr.de>; Wed, 13 Oct 2021 13:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231728AbhJMLD2 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 13 Oct 2021 07:03:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231388AbhJMLDS (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 13 Oct 2021 07:03:18 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9592DC0612EB
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 Oct 2021 04:00:15 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id s11so1939366pgr.11
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 Oct 2021 04:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nQQWQUgxuW6Tu+PRvCtkwuIVHgAhZ7y427FiGzCqW1I=;
        b=zuDceFqPkzhsXg/5Ra0cCOC1bU0nBHOgMC+yisKtXJINh/T8f5KQ5Xk3tN1hEQWy1f
         fF/5Ti7SlnxHTZ8CRdyv6Jl7qV6+yL697U37ZNkhKajiI+l/0MJiVPCdQ2f0nPB60e3l
         deL9dfPtSkXLUF1i0K5lBK/jrlNzSLsedO4pErBw8lcHrmTQsFpVw/Kq9PVvZIU+2X3S
         BjO3inmiQSb4KC3RcJr5s4SFs01LRfMOjiO3Y4IdS3Rj0CRwh+XHIqdFiSxlkBam0yxV
         rxKuYNPGd/pLOsHpTEsqWBSUGsQm4kgH2TClaSNsf9ya4bJIDlxKTpNOca2+BLM7jp/t
         D1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nQQWQUgxuW6Tu+PRvCtkwuIVHgAhZ7y427FiGzCqW1I=;
        b=1UhNPnGEXhFNFWYqAUMmmsj6tlutIjdho69KCJeDLZObE8krI3TOq4wCOodHBNoH4g
         om1PNfO70RC6zIFMNVCuXsG/86I9tZzE8Rc1Sw0Lhz+NyDRoEotYvgfxpHCCq+x5Zmca
         8Ii638XZN5vsJp2KcarKvON1MWYRAY8961wb0AIaUyunxGD0Faw7jcftswROW6NNFU+G
         q/VWNRLwLL5PPBgD7eZY1IKu7GtdH40x2j8BM0qJCUVJF/ZtqnpzXZ2CpTWEifLpkFfd
         DyuBlQNOHpegbsk0cnDbDuiRxKZstdbshJEtNtlhtuzMzkOV+4JZhOxCBW0ijrg78BCC
         7aLg==
X-Gm-Message-State: AOAM53054VidrTWpbvirGNQ1CNj31VQ9tS1VnrLP7apijjevy/gn07/8
        sNjfcC/tORpm8T0e/UUBsbsr3Q==
X-Google-Smtp-Source: ABdhPJxhzjNSoABq+dGG77CzsRDyX+40KYVEdGsQI8qW5B1JHU6i8UmOJoBqJRMmoCIvhAQ+em8rxg==
X-Received: by 2002:a63:2dc7:: with SMTP id t190mr27705777pgt.455.1634122814960;
        Wed, 13 Oct 2021 04:00:14 -0700 (PDT)
Received: from localhost ([106.201.113.61])
        by smtp.gmail.com with ESMTPSA id g189sm5284657pfb.75.2021.10.13.04.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 04:00:14 -0700 (PDT)
Date:   Wed, 13 Oct 2021 16:30:12 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     linux-kernel@vger.kernel.org, Jeff Dike <jdike@addtoit.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Jason Wang <jasowang@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Jens Axboe <axboe@kernel.dk>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Amit Shah <amit@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Gonglei <arei.gonglei@huawei.com>,
        "David S. Miller" <davem@davemloft.net>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        David Airlie <airlied@linux.ie>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Daniel Vetter <daniel@ffwll.ch>, Jie Deng <jie.deng@intel.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Kalle Valo <kvalo@codeaurora.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Ira Weiny <ira.weiny@intel.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        David Hildenbrand <david@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>,
        Miklos Szeredi <miklos@szeredi.hu>,
        Eric Van Hensbergen <ericvh@gmail.com>,
        Latchesar Ionkov <lucho@ionkov.net>,
        Dominique Martinet <asmadeus@codewreck.org>,
        Stefano Garzarella <sgarzare@redhat.com>,
        Anton Yakovlev <anton.yakovlev@opensynergy.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-um@lists.infradead.org,
        virtualization@lists.linux-foundation.org,
        linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-i2c@vger.kernel.org, iommu@lists.linux-foundation.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        nvdimm@lists.linux.dev, linux-remoteproc@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        v9fs-developer@lists.sourceforge.net, kvm@vger.kernel.org,
        alsa-devel@alsa-project.org
Subject: Re: [PATCH RFC] virtio: wrap config->reset calls
Message-ID: <20211013110012.3exppbls2wggqfhb@vireshk-i7>
References: <20211013105226.20225-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013105226.20225-1-mst@redhat.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 13-10-21, 06:55, Michael S. Tsirkin wrote:
> This will enable cleanups down the road.
> The idea is to disable cbs, then add "flush_queued_cbs" callback
> as a parameter, this way drivers can flush any work
> queued after callbacks have been disabled.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  drivers/gpio/gpio-virtio.c                 | 2 +-
>  drivers/i2c/busses/i2c-virtio.c            | 2 +-

Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
