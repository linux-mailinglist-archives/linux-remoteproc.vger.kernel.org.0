Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64AC01AE82B
	for <lists+linux-remoteproc@lfdr.de>; Sat, 18 Apr 2020 00:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728617AbgDQWYd (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 17 Apr 2020 18:24:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728496AbgDQWYd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 17 Apr 2020 18:24:33 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 263A9C061A0F
        for <linux-remoteproc@vger.kernel.org>; Fri, 17 Apr 2020 15:24:33 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id e127so4096761iof.6
        for <linux-remoteproc@vger.kernel.org>; Fri, 17 Apr 2020 15:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9l7ReVXML5iC1lUXKjwrOgZKOV8ZzgKkL7y7FQ7TRC8=;
        b=Spf98Qg5qFQCzvnqgZgRv9fmE2Syrwc7Gqbh4i98GT3U8W9nhHwgX5Fcoc//T54NMd
         0uY892q8flmpGYSSbSgi5bH6fe3fDZ7klazcneNNR3pbC0X5zgLLwFCm4VfMXd5hZgos
         +8SamfzzVfSj/m1igwp6sMozIYa9LWyURM0yc30+WMlTJP2dN2pZHnBWatc+oBu6HXyN
         Eqfu5VFV6290Xm9etLyap+97UVMongeQ90ZfalwAGBQqKt0xKzYuiKRBxP5cBP4YiCx2
         0LK61hzM0pcDfDj2SKcLvZxWrT+LWLhyCIUQUrftJOz0ZCi2pf8748pbsVL+kCKxU51d
         9oXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9l7ReVXML5iC1lUXKjwrOgZKOV8ZzgKkL7y7FQ7TRC8=;
        b=iJQJTFd3WXO8k56ejc8R9EuD+Ky4nA7BidrM/uuZfHT+SC5lrnxD9Im+4f/fla3XYq
         jX1SZTTL+X5OEPG0P7vAB01t84lHUZa6m4N9d+dSUY/GEAknZ0FkJ2G6/jNLsgUyaD0s
         6zPOlk2fa630URh3yIVJRLr5q2hHTza7xAZojYsT/36fLXXl0TCagELmEnS/1YxIWPco
         IhjGn1pxvUUZBnPmCDEQ+t2bXQAoLlyRGI6aj/YrIswU0922WMiIPEF4X1l+aURdh0kE
         BhVNHDH7JpzU7f9VrtW/80PWba263RkHRqLa+CTym51jp8EsDRfi8Tf9bf63cq1FoN66
         1EpA==
X-Gm-Message-State: AGi0PubzolX7/ZD1xWCUpZY5mP9ogfWbptxBlbEtrblOeweSOBU5Ubhh
        dPrZ94QsLzyNLNNH5chqH2OSMVFmvmadsq2RtF0yew==
X-Google-Smtp-Source: APiQypL6PL6+MLLIpNc0SmvY24c0Q4ez5CT8xBF/CqHav+Y7obUoOyXH/xedbXEuqARaRaw8L9lptDwOz6Nj/dxncHY=
X-Received: by 2002:a6b:8bd2:: with SMTP id n201mr5392033iod.131.1587162272197;
 Fri, 17 Apr 2020 15:24:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200304142628.8471-1-NShubin@topcon.com> <20200406113310.3041-1-nikita.shubin@maquefel.me>
 <20200406113310.3041-2-nikita.shubin@maquefel.me> <20200414164519.GA24061@xps15>
 <45761587100993@mail.yandex.ru> <CANLsYkxvuwFdG3YnE7tTxQaD7uF0d_XnPjt1KS++FFe0W3fbdw@mail.gmail.com>
 <20200417202653.00002500@maquefel.me>
In-Reply-To: <20200417202653.00002500@maquefel.me>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Fri, 17 Apr 2020 16:24:21 -0600
Message-ID: <CANLsYkyUoG9fW7NoXMS1D7WjPGew7FT0jyOP1E0ipmwW-qEG7A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] remoteproc: imx_rproc: set pc on start
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Nikita Shubin <nshubin@topcon.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, 17 Apr 2020 at 11:27, Nikita Shubin <nikita.shubin@maquefel.me> wrote:
>
> On Fri, 17 Apr 2020 11:01:22 -0600
> Mathieu Poirier <mathieu.poirier@linaro.org> wrote:
>
> > On Thu, 16 Apr 2020 at 23:40, <nikita.shubin@maquefel.me> wrote:
> > >
> > > Hi Mathieue,
> > >
> > > Hi Nikita,
> > >
> > > On Mon, Apr 06, 2020 at 02:33:08PM +0300, nikita.shubin@maquefel.me
> > > wrote:
> > >
> > >  In case elf file interrupt vector is not supposed to be at OCRAM_S,
> > >  it is needed to write elf entry point to OCRAM_S + 0x4, to boot M4
> > >  firmware.
> > >
> > >  Otherwise firmware located anywhere besides OCRAM_S won't boot.
> > >
> > >  The firmware must set stack poiner as first instruction:
> > >
> > >  Reset_Handler:
> > >      ldr sp, = __stack /* set stack pointer */
> > >
> > >  Signed-off-by: Nikita Shubin <NShubin@topcon.com>
> > >
> > >
> > > The address in the SoB has to match what is found in the "From:"
> > > field of the email header. Checkpatch is complaining about that,
> > > something I would have expected to be fixed before sending this set
> > > out.
> > >
> > > Noted and will be fixed.
> > >
> > >  ---
> > >   drivers/remoteproc/imx_rproc.c | 16 +++++++++++++++-
> > >   1 file changed, 15 insertions(+), 1 deletion(-)
> > >
> > >  diff --git a/drivers/remoteproc/imx_rproc.c
> > > b/drivers/remoteproc/imx_rproc.c index 3e72b6f38d4b..bebc58d0f711
> > > 100644 --- a/drivers/remoteproc/imx_rproc.c
> > >  +++ b/drivers/remoteproc/imx_rproc.c
> > >  @@ -45,6 +45,8 @@
> > >
> > >   #define IMX7D_RPROC_MEM_MAX 8
> > >
> > >  +#define IMX_BOOT_PC 0x4
> > >  +
> > >   /**
> > >    * struct imx_rproc_mem - slim internal memory structure
> > >    * @cpu_addr: MPU virtual address of the memory region
> > >  @@ -85,6 +87,7 @@ struct imx_rproc {
> > >           const struct imx_rproc_dcfg *dcfg;
> > >           struct imx_rproc_mem mem[IMX7D_RPROC_MEM_MAX];
> > >           struct clk *clk;
> > >  + void __iomem *bootreg;
> > >   };
> > >
> > >   static const struct imx_rproc_att imx_rproc_att_imx7d[] = {
> > >  @@ -162,11 +165,16 @@ static int imx_rproc_start(struct rproc
> > > *rproc) struct device *dev = priv->dev;
> > >           int ret;
> > >
> > >  + /* write entry point to program counter */
> > >  + writel(rproc->bootaddr, priv->bootreg);
> > >
> > >
> > > What happens on all the other IMX systems where this fix is not
> > > needed? Will they continue to work properly?
> > >
> > > Yes, my bad, it is also needed for IMX6 (but even so i need to
> > > study this topic more carefully), this should be applied
> > > exclusively for imx7d for now, and if will be needed someone with
> > > imx6 hardware to test on can extend this on imx6 also.
> > >
> > >
> > >
> > >
> > >  +
> > >           ret = regmap_update_bits(priv->regmap, dcfg->src_reg,
> > >                                    dcfg->src_mask, dcfg->src_start);
> > >           if (ret)
> > >                   dev_err(dev, "Failed to enable M4!\n");
> > >
> > >  + dev_info(&rproc->dev, "Started from 0x%x\n", rproc->bootaddr);
> > >  +
> > >           return ret;
> > >   }
> > >
> > >  @@ -182,6 +190,9 @@ static int imx_rproc_stop(struct rproc *rproc)
> > >           if (ret)
> > >                   dev_err(dev, "Failed to stop M4!\n");
> > >
> > >  + /* clear entry points */
> > >  + writel(0, priv->bootreg);
> > >  +
> > >           return ret;
> > >   }
> > >
> > >  @@ -243,7 +254,8 @@ static void *imx_rproc_da_to_va(struct rproc
> > > *rproc, u64 da, int len) static const struct rproc_ops
> > > imx_rproc_ops = { .start = imx_rproc_start,
> > >           .stop = imx_rproc_stop,
> > >  - .da_to_va = imx_rproc_da_to_va,
> > >  + .da_to_va = imx_rproc_da_to_va,
> > >  + .get_boot_addr = rproc_elf_get_boot_addr,
> > >
> > >
> > > How is this useful? Sure it will set rproc->bootaddr in
> > > rproc_fw_boot() but what good does that do when it is invariably
> > > set again in imx_rproc_start() ?
> > >
> > > The priv->bootreg is the address where we are writing Entry Point
> > > and it is fixed, 0x04 address is translated to 0x00180004, so don't
> > > quite understand you we are writing rproc->bootaddr into
> > > priv->bootreg, not wiseversa.
> > >
> >
> > What is your reason to set ops->get_boot_addr ?  How does that help
> > the work done in this patch?
>
> The reason is the following :
>
> remoteproc_core.c:
> | rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
> | rproc->bootaddr = rproc_get_boot_addr(rproc, fw);
>
> remoteproc_internal.h
> | static inline
> | u32 rproc_get_boot_addr(struct rproc *rproc, const struct firmware
> *fw) | {
> |       if (rproc->ops->get_boot_addr)
> |               return rproc->ops->get_boot_addr(rproc, fw);
> |
> |       return 0;
> | }

And as I said above the value of rproc->bootaddr is set to
priv->bootreg in imx_rproc_stop().  What am I missing?  More over
imx_rproc_ops doesn't have a ->load() function and as such rproc_alloc
will set it to rproc_elf_get_boot_addr()

>
> >
> > >
> > >   };
> > >
> > >   static int imx_rproc_addr_init(struct imx_rproc *priv,
> > >  @@ -360,6 +372,8 @@ static int imx_rproc_probe(struct
> > > platform_device *pdev) goto err_put_rproc;
> > >           }
> > >
> > >  + priv->bootreg = imx_rproc_da_to_va(rproc, IMX_BOOT_PC,
> > > sizeof(u32)); +
> > >           /*
> > >            * clk for M4 block including memory. Should be
> > >            * enabled before .start for FW transfer.
> > >  --
> > >  2.25.1
> > >
>
