Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 923209F5CE
	for <lists+linux-remoteproc@lfdr.de>; Wed, 28 Aug 2019 00:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726025AbfH0WHO (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 27 Aug 2019 18:07:14 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37428 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725976AbfH0WHO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 27 Aug 2019 18:07:14 -0400
Received: by mail-pg1-f196.google.com with SMTP id d1so224992pgp.4
        for <linux-remoteproc@vger.kernel.org>; Tue, 27 Aug 2019 15:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JRsLR75QBbtFPEoo6FTBbqVJvymrGpw03cigQGOg42c=;
        b=VcjhuM4zuLxMnMNqOpPhcjufeybyAO7mQbdE9srbbULJC5WSlzLbtvM4zmb7bkPF+q
         vU2M/P4QBSCXXIHzSgdvhP3QQGSFxW9d/5Do01DxO1fUAfWEEW6ix0atxs9YoF1Fw+Kj
         dW7KPa2RKiujBC7jO+p7FSNpr1kju43tH8Fu1BnWFWolGlKnc4mByPv114s5cr6h7cQJ
         JIa7HbuqRhwlQ3hsJT8aetDFFmh08uxImpzLrlsGJDjOGrAd4mWuTjsQ7ocJg8iH30QF
         TQtTDB5GDv6jcPpEJAFtSa2jEGr1n+K2QOOeVEROSqJ16ziIBKc7Bix1CDIQY92HAcRY
         DTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JRsLR75QBbtFPEoo6FTBbqVJvymrGpw03cigQGOg42c=;
        b=QGX4pN9Ph+BRgDNDDX6NDTkAPyIfbY+Fgi0bqsrOSCRTKmlo+JViBFQJCw3uZJVCmU
         ENa4kTSWTkhlJc3hKfq3helzCxxs8n6QtyBhqvhy273V4PEyE3Un23TtEc7pN7b8reru
         PuMqgYGe9+ki5i7iqA4Fp0tnwKmNZOqcCIJXjIkW4Lan2ZsOOXMWvMH6sjLdtrF7N4UY
         KcLJ6PHiJD6qpsFXkGC82QOMCuG8nZ7E711QaZoimdco7//rTfNFBlByna9KslrJxTvo
         /iWX3MBC/KRTPmbKSXkXHC3DripyrCRRE4X2bsGKtdb/PEuO9ZXVqsYdVBCKu2+9rh57
         DkPA==
X-Gm-Message-State: APjAAAVRj6WPmOxph7Z3YPAdoY9D8Kq3Iujjg9THv3JJ0/xf019f0JaL
        FM2AMcj40u85RMhMQeSM+EMvvA==
X-Google-Smtp-Source: APXvYqw9HeVUwZAckWW6qXBs8bJo1tCP6q4Gsyeg8AyC5HTnjGnTgFf+uML+YEKWxrxlMACvtMJOIg==
X-Received: by 2002:a63:7205:: with SMTP id n5mr559549pgc.443.1566943633743;
        Tue, 27 Aug 2019 15:07:13 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id r1sm315183pgv.70.2019.08.27.15.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 15:07:13 -0700 (PDT)
Date:   Tue, 27 Aug 2019 15:07:11 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     linux-remoteproc@vger.kernel.org,
        Loic Pallardy <loic.pallardy@st.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] rpmsg: virtio_rpmsg_bus: replace "%p" with "%pK"
Message-ID: <20190827220711.GK6167@minitux>
References: <20181024011909.21674-1-s-anna@ti.com>
 <40831f80-1e36-66ca-b8e5-684d46ba167e@ti.com>
 <20190827051007.GK1263@builder>
 <8d36d695-dd66-c21f-f49e-f6dc3dbdfc5a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d36d695-dd66-c21f-f49e-f6dc3dbdfc5a@ti.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 27 Aug 13:25 PDT 2019, Suman Anna wrote:

> Hi Bjorn,
> 
> On 8/27/19 12:10 AM, Bjorn Andersson wrote:
> > On Fri 09 Aug 13:25 PDT 2019, Suman Anna wrote:
> > 
> >> Hi Bjorn,
> >>
> > 
> > Hi Suman
> > 
> >> On 10/23/18 8:19 PM, Suman Anna wrote:
> >>> The virtio_rpmsg_bus driver uses the "%p" format-specifier for
> >>> printing the vring buffer address. This prints only a hashed
> >>> pointer even for previliged users. Use "%pK" instead so that
> >>> the address can be printed during debug using kptr_restrict
> >>> sysctl.
> >>
> >> Seems to have been lost among the patches, can you pick up this trivial
> >> patch for 5.4? Should apply cleanly on the latest HEAD as well.
> >>
> > 
> > I share Andrew's question regarding what benefit you have from knowing
> > this value. Should we not just remove the va from the print? Or do you
> > actually have a use case for it?.
> 
> I mainly use it during debug when comparing against kernel_page_tables
> and vmallocinfo. The pools that we use are not always guaranteed to be
> from linear memory, and behavior changes when using with CMA or DMA pools.
> 

Thanks Suman. It seems to me that there's room for improvement to aid
this kind of debugging. But your usecase seems reasonable, so I'm
merging the patch.

> Note that usage of %pK does not leak the addresses automatically, but
> atleast enables me to get the values when needed. The changes also bring
> the usage in rpmsg core in sync with the remoteproc core.
> 

Sounds like shouldn't have merged them in remoteproc then ;P

Thanks,
Bjorn

> regards
> Suman
> 
> > 
> > Regards,
> > Bjorn
> > 
> >> regards
> >> Suman
> >>
> >>>
> >>> Signed-off-by: Suman Anna <s-anna@ti.com>
> >>> ---
> >>>  drivers/rpmsg/virtio_rpmsg_bus.c | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> >>> index f29dee731026..1345f373a1a0 100644
> >>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> >>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> >>> @@ -950,7 +950,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
> >>>  		goto vqs_del;
> >>>  	}
> >>>  
> >>> -	dev_dbg(&vdev->dev, "buffers: va %p, dma %pad\n",
> >>> +	dev_dbg(&vdev->dev, "buffers: va %pK, dma %pad\n",
> >>>  		bufs_va, &vrp->bufs_dma);
> >>>  
> >>>  	/* half of the buffers is dedicated for RX */
> >>>
> >>
> 
