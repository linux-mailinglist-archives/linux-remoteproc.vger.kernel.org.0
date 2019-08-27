Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EFC29F603
	for <lists+linux-remoteproc@lfdr.de>; Wed, 28 Aug 2019 00:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbfH0WXH (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 27 Aug 2019 18:23:07 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:36619 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbfH0WXH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 27 Aug 2019 18:23:07 -0400
Received: by mail-pf1-f196.google.com with SMTP id w2so309353pfi.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 27 Aug 2019 15:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Yf7KPUEZygXXJwexFq8sVNy80of36QU2BvfS1YFc1uQ=;
        b=DxFQR+oulqH7TZnTFeO0AXmXGWRw8zDTd9MWpugL+0n0Aib5ZMDh0gKtEc64fyTaiU
         FOLFQM2CYjumpVL2LFM5EEYzq4YUwR6QM+ekFlz7+xb+HRUbv/RyO2SJnKXHK3b0s/Yd
         IMZgA4l2y+ygNdcJ2lwr9Nf98wFppYDeZP7g7/uvRjzpBhkCXktHh6rJ0Q5sObuQCLxi
         +dOE9bCEq8kSCE3qyIGnytkRwVgV9bV4LTVBmEjwGchqt6zzrZB7w8HYm+k4cH8NwrPa
         Up8sfath9FNbmrmDKJ03kPgTxUQYfR7SHwXZf27HzkMOy7vJNst6hgvquS/xoNnBS0OE
         QEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Yf7KPUEZygXXJwexFq8sVNy80of36QU2BvfS1YFc1uQ=;
        b=shpZ8a2cOdB7agwSoX1Zk7d7TEi7P+hTVPGKP6olyCAKFLt8lr1eDmztTngam5R40Q
         6Wwf+qyvOoBSGAu2Fr/HpXawRGYR6S+c3QFtZpJ190dSWBXOpa2/UQXDP5zF16Ql5RXm
         783X+dNddn2BUelOJw2vd9asiQdbbKctg0PQQPTnrVAPD1yoVasukbJ9s/sWTmYG69Lt
         ibZRY3GX+xsMrTLF2f/EsnnfAvw/qNSyKp5jxkiK9c4trZGpLQDKzh03FioXqFuCknnE
         br9taGwIMtZuHWKyxKv0b1kQ0K1KXQLh+6KJuNovSb/Idr1R35qCuKcoZ0AwF47tawA8
         BWNQ==
X-Gm-Message-State: APjAAAUg09ZcNww5wnwKXm1v7VJo+7mhWuh4n0Zc3d6irYlQSkajaWXa
        sMZMxEX3p6g9urSDY1a6+HpO8Ntku+o=
X-Google-Smtp-Source: APXvYqwT2hpO40tTWBillytawrpLvYzOYf+8qLwBYvEHB+YRDUUxG6ERLaAlK0jg+ytA3DztYQumOA==
X-Received: by 2002:a17:90a:2047:: with SMTP id n65mr1050342pjc.5.1566944586260;
        Tue, 27 Aug 2019 15:23:06 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z25sm313775pfa.91.2019.08.27.15.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 15:23:05 -0700 (PDT)
Date:   Tue, 27 Aug 2019 15:23:03 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     linux-remoteproc@vger.kernel.org,
        Loic Pallardy <loic.pallardy@st.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] rpmsg: virtio_rpmsg_bus: replace "%p" with "%pK"
Message-ID: <20190827222303.GL6167@minitux>
References: <20181024011909.21674-1-s-anna@ti.com>
 <40831f80-1e36-66ca-b8e5-684d46ba167e@ti.com>
 <20190827051007.GK1263@builder>
 <8d36d695-dd66-c21f-f49e-f6dc3dbdfc5a@ti.com>
 <20190827220711.GK6167@minitux>
 <619b06b0-c3cc-e36f-c3e5-d13e98520c9c@ti.com>
 <9c5f95a0-c95b-bf68-e78f-6e3d4d837b1e@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c5f95a0-c95b-bf68-e78f-6e3d4d837b1e@ti.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 27 Aug 15:17 PDT 2019, Suman Anna wrote:

> On 8/27/19 5:15 PM, Suman Anna wrote:
> > On 8/27/19 5:07 PM, Bjorn Andersson wrote:
> >> On Tue 27 Aug 13:25 PDT 2019, Suman Anna wrote:
> >>
> >>> Hi Bjorn,
> >>>
> >>> On 8/27/19 12:10 AM, Bjorn Andersson wrote:
> >>>> On Fri 09 Aug 13:25 PDT 2019, Suman Anna wrote:
> >>>>
> >>>>> Hi Bjorn,
> >>>>>
> >>>>
> >>>> Hi Suman
> >>>>
> >>>>> On 10/23/18 8:19 PM, Suman Anna wrote:
> >>>>>> The virtio_rpmsg_bus driver uses the "%p" format-specifier for
> >>>>>> printing the vring buffer address. This prints only a hashed
> >>>>>> pointer even for previliged users. Use "%pK" instead so that
> >>>>>> the address can be printed during debug using kptr_restrict
> >>>>>> sysctl.
> >>>>>
> >>>>> Seems to have been lost among the patches, can you pick up this trivial
> >>>>> patch for 5.4? Should apply cleanly on the latest HEAD as well.
> >>>>>
> >>>>
> >>>> I share Andrew's question regarding what benefit you have from knowing
> >>>> this value. Should we not just remove the va from the print? Or do you
> >>>> actually have a use case for it?.
> >>>
> >>> I mainly use it during debug when comparing against kernel_page_tables
> >>> and vmallocinfo. The pools that we use are not always guaranteed to be
> >>> from linear memory, and behavior changes when using with CMA or DMA pools.
> >>>
> >>
> >> Thanks Suman. It seems to me that there's room for improvement to aid
> >> this kind of debugging. But your usecase seems reasonable, so I'm
> >> merging the patch.
> > 
> > Thanks Bjorn.
> 
> Btw, looks like you applied the patch against rproc-next instead of
> rpmsg-next.
> 

Thanks for noticing so quick; I moved the change to the correct
branch.

Regards,
Bjorn

> regards
> Suman
> 
> > 
> >>
> >>> Note that usage of %pK does not leak the addresses automatically, but
> >>> atleast enables me to get the values when needed. The changes also bring
> >>> the usage in rpmsg core in sync with the remoteproc core.
> >>>
> >>
> >> Sounds like shouldn't have merged them in remoteproc then ;P
> > 
> > Slightly different reasoning looking at the commit, it was probably when
> > %p was leaking the addresses.
> > 
> > regards
> > Suman
> > 
> >>
> >> Thanks,
> >> Bjorn
> >>
> >>> regards
> >>> Suman
> >>>
> >>>>
> >>>> Regards,
> >>>> Bjorn
> >>>>
> >>>>> regards
> >>>>> Suman
> >>>>>
> >>>>>>
> >>>>>> Signed-off-by: Suman Anna <s-anna@ti.com>
> >>>>>> ---
> >>>>>>  drivers/rpmsg/virtio_rpmsg_bus.c | 2 +-
> >>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>>
> >>>>>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> >>>>>> index f29dee731026..1345f373a1a0 100644
> >>>>>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> >>>>>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> >>>>>> @@ -950,7 +950,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
> >>>>>>  		goto vqs_del;
> >>>>>>  	}
> >>>>>>  
> >>>>>> -	dev_dbg(&vdev->dev, "buffers: va %p, dma %pad\n",
> >>>>>> +	dev_dbg(&vdev->dev, "buffers: va %pK, dma %pad\n",
> >>>>>>  		bufs_va, &vrp->bufs_dma);
> >>>>>>  
> >>>>>>  	/* half of the buffers is dedicated for RX */
> >>>>>>
> >>>>>
> >>>
> > 
> 
