Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B7419DD03
	for <lists+linux-remoteproc@lfdr.de>; Tue, 27 Aug 2019 07:10:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729151AbfH0FKL (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 27 Aug 2019 01:10:11 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38675 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729149AbfH0FKK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 27 Aug 2019 01:10:10 -0400
Received: by mail-pg1-f195.google.com with SMTP id e11so11941920pga.5
        for <linux-remoteproc@vger.kernel.org>; Mon, 26 Aug 2019 22:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kue46rIH4JbVHYlsaa+MeXhi8APX3bNmyCw0oXBiDLk=;
        b=KuMqge6vlDfh8jKRoUD1gXms5XSFdS1FlnpSUUgkV3Anmlc5b2oHqJbvmp9PRK9HwC
         cXoaHeEt91RFR/N/ICoDIUULdkm9h3zMfzEZUg03XCSuWbDcmXj6mlOFtvixsfmRpljM
         +f80ERIcyeyyyhaKaWGX+70wWZTaNrqFIFiQZwBBU31lphbOAMIXNQAfQkydWDf4u7VD
         ZUfkl/7pxtzhTER9JrlBceTvZGBiuHFxDYQPj3hNCwxhDaiTEVkDTAMBqqgZ67LE/pLm
         s28iAqXtdlfxdlO3SY/yKy70m/oc1Qbb8nWkxpueiPJk2i8QRIInyzbhB57hxPpRiAFI
         hgEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kue46rIH4JbVHYlsaa+MeXhi8APX3bNmyCw0oXBiDLk=;
        b=ZRFSaRn7I9gfVYgm+x83m/eQyj8py1suRphmEN+dsEew8UvYANDXiOsh5bAvwUfyms
         3DOqyZ+chdmeEnJDr+kgaXWTPYV1jCoZhgHhazDTb4Oc3nLM90k+An2SlI5Qn9YbouKf
         pZQBSW82umR2l7/cxcLZCMKFceaRa3wze3T7K5BO7uvwWN1rNuDNvdoGZu5iANjvYLV2
         OI0kSZTVvabNdV/AYgLkYZKEFxmtKJ2ftvtMDt/NPLmHeqAhgFHWyAm7ybo7Q+EEhbLb
         lTMIzFxhVaFXeZB1db1AWFrI9EE17fDL9XPyz5YSP7it0aLoNA69S/RE9Zlk7RlQrFGd
         0XWw==
X-Gm-Message-State: APjAAAXYAPTvrov8tuf9p++ZavS4iwKz7kIi2gBkyE6nD5gaFErtWKR/
        6zdAK8b2SAdgNwKSeyzzCaLGsQ==
X-Google-Smtp-Source: APXvYqwcaGrGmBqQbq+ZXIx4wrncCySdMwJsO+BZOga+pwX1bi4P2t3U7PQxLtkRvcP8a/wee3hCMQ==
X-Received: by 2002:a17:90a:250c:: with SMTP id j12mr23377818pje.96.1566882609922;
        Mon, 26 Aug 2019 22:10:09 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y8sm21644391pfr.140.2019.08.26.22.10.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Aug 2019 22:10:09 -0700 (PDT)
Date:   Mon, 26 Aug 2019 22:10:07 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     linux-remoteproc@vger.kernel.org,
        Loic Pallardy <loic.pallardy@st.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] rpmsg: virtio_rpmsg_bus: replace "%p" with "%pK"
Message-ID: <20190827051007.GK1263@builder>
References: <20181024011909.21674-1-s-anna@ti.com>
 <40831f80-1e36-66ca-b8e5-684d46ba167e@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40831f80-1e36-66ca-b8e5-684d46ba167e@ti.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri 09 Aug 13:25 PDT 2019, Suman Anna wrote:

> Hi Bjorn,
> 

Hi Suman

> On 10/23/18 8:19 PM, Suman Anna wrote:
> > The virtio_rpmsg_bus driver uses the "%p" format-specifier for
> > printing the vring buffer address. This prints only a hashed
> > pointer even for previliged users. Use "%pK" instead so that
> > the address can be printed during debug using kptr_restrict
> > sysctl.
> 
> Seems to have been lost among the patches, can you pick up this trivial
> patch for 5.4? Should apply cleanly on the latest HEAD as well.
> 

I share Andrew's question regarding what benefit you have from knowing
this value. Should we not just remove the va from the print? Or do you
actually have a use case for it?

Regards,
Bjorn

> regards
> Suman
> 
> > 
> > Signed-off-by: Suman Anna <s-anna@ti.com>
> > ---
> >  drivers/rpmsg/virtio_rpmsg_bus.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> > index f29dee731026..1345f373a1a0 100644
> > --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> > +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> > @@ -950,7 +950,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
> >  		goto vqs_del;
> >  	}
> >  
> > -	dev_dbg(&vdev->dev, "buffers: va %p, dma %pad\n",
> > +	dev_dbg(&vdev->dev, "buffers: va %pK, dma %pad\n",
> >  		bufs_va, &vrp->bufs_dma);
> >  
> >  	/* half of the buffers is dedicated for RX */
> > 
> 
