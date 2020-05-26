Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B758C1AE14F
	for <lists+linux-remoteproc@lfdr.de>; Fri, 17 Apr 2020 17:38:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729046AbgDQPh5 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 17 Apr 2020 11:37:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729008AbgDQPh5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 17 Apr 2020 11:37:57 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1B8BC061A0F
        for <linux-remoteproc@vger.kernel.org>; Fri, 17 Apr 2020 08:37:55 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id w20so2764536iob.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 17 Apr 2020 08:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dZWbHNkoj0JZBFRa+7yN5L8lU5vuTUFT6sy1jTrj+/w=;
        b=J+rBrCBFPfAcAzCoUBAgycYe++RupvfFwXFvaRbQpkLMxxN0S5WCn5cfjJVIlCrQ36
         mL/IQ1yzyXK05wmytKfYtt17r1lzKS7l58phN2KOR+QZMYeOhlirBW0EDynJUSOhURcA
         0yLVVi2Pi+WeHoYF8YGqMHXGOmXScTtxuU4ZoeUTke6WePb0YpP0ExmMFCjtbobWwjlE
         5LJSPXy7TAM2r7eL8t3JNlDzZW9D7pRmqlUYFkZmYN+XTlAnawgyG+BuIkDsqFp510mC
         EVLl9N0yjmJmjUtq2LqTyZsvQhM+9Fw3ZRffjIjjCSSd2GJmYx+ku80QFsStAhKZXgtw
         5SWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dZWbHNkoj0JZBFRa+7yN5L8lU5vuTUFT6sy1jTrj+/w=;
        b=uDbrS3Dbdj+AAy9IwQDo6QgZnEx9V1Em9AGeLO3pBaKJo3RcPkQ5i6SI5RHmC5DWQO
         8UDfDPiTU9k7InY3gJmsS+r87HNi5vEFQmP2gqTWC1Sbueqs4MCAtboKb54SX4arc73E
         NUuRvjxsdcsyxXOQncghatfVbQZ3qnSiNP7HgZjbw69D2Uw4Jq7i4IJkccOH48UTKA6f
         3CI2W3Nq/XkgYzJE7n1nclDi6sTmAbhDhGrxWVpaPEqJOZqM30teP9IlXVuYXlKFAAaC
         Yyz9MzzGsehWEWjHMDmqqIGMvFbw06sStJsqWCL194uwMugIJtb3of2TxLsPrB1x1w5g
         aGGQ==
X-Gm-Message-State: AGi0PuYSIEDpOOYojido+wzCMy+AdtFHi6RhXdwYpQuhIBvuGRfJNA00
        H7lYzJak5tegcIkv1QMOaEz+cRSieU8gRilGDxEjMA==
X-Google-Smtp-Source: APiQypI0krjI+mvmWnI3ESAaCfeAhP5hfOH/kONmQVYxbtIdkgljt8qhfrmnxB6jyEg7Dngv0pYSHIFhvNB4U/D3cbU=
X-Received: by 2002:a6b:3842:: with SMTP id f63mr3467174ioa.90.1587137873074;
 Fri, 17 Apr 2020 08:37:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200304142628.8471-1-NShubin@topcon.com> <20200406113310.3041-1-nikita.shubin@maquefel.me>
 <20200406113310.3041-2-nikita.shubin@maquefel.me> <20200414164519.GA24061@xps15>
 <20200417151132.00005f8c@maquefel.me>
In-Reply-To: <20200417151132.00005f8c@maquefel.me>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Fri, 17 Apr 2020 09:37:42 -0600
Message-ID: <CANLsYkxeL+a43eDzwJjXyFBFSwRVXjiYd4TcTbEcuuj+wgEZdw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] remoteproc: imx_rproc: set pc on start
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Nikita Shubin <NShubin@topcon.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, 17 Apr 2020 at 06:12, Nikita Shubin <nikita.shubin@maquefel.me> wrote:
>
> On Tue, 14 Apr 2020 10:45:19 -0600
> Mathieu Poirier <mathieu.poirier@linaro.org> wrote:
>
> > Hi Nikita,
> >
> > On Mon, Apr 06, 2020 at 02:33:08PM +0300, nikita.shubin@maquefel.me
> > wrote:
> > > In case elf file interrupt vector is not supposed to be at OCRAM_S,
> > > it is needed to write elf entry point to OCRAM_S + 0x4, to boot M4
> > > firmware.
> > >
> > > Otherwise firmware located anywhere besides OCRAM_S won't boot.
> > >
> > > The firmware must set stack poiner as first instruction:
> > >
> > > Reset_Handler:
> > >     ldr   sp, = __stack      /* set stack pointer */
> > >
> > > Signed-off-by: Nikita Shubin <NShubin@topcon.com>
> >
> > The address in the SoB has to match what is found in the "From:"
> > field of the email header.  Checkpatch is complaining about that,
> > something I would have expected to be fixed before sending this set
> > out.
> >
> > > ---
> > >  drivers/remoteproc/imx_rproc.c | 16 +++++++++++++++-
> > >  1 file changed, 15 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/remoteproc/imx_rproc.c
> > > b/drivers/remoteproc/imx_rproc.c index 3e72b6f38d4b..bebc58d0f711
> > > 100644 --- a/drivers/remoteproc/imx_rproc.c
> > > +++ b/drivers/remoteproc/imx_rproc.c
> > > @@ -45,6 +45,8 @@
> > >
> > >  #define IMX7D_RPROC_MEM_MAX                8
> > >
> > > +#define IMX_BOOT_PC                        0x4
> > > +
> > >  /**
> > >   * struct imx_rproc_mem - slim internal memory structure
> > >   * @cpu_addr: MPU virtual address of the memory region
> > > @@ -85,6 +87,7 @@ struct imx_rproc {
> > >     const struct imx_rproc_dcfg     *dcfg;
> > >     struct imx_rproc_mem
> > > mem[IMX7D_RPROC_MEM_MAX]; struct clk                        *clk;
> > > +   void __iomem                    *bootreg;
> > >  };
> > >
> > >  static const struct imx_rproc_att imx_rproc_att_imx7d[] = {
> > > @@ -162,11 +165,16 @@ static int imx_rproc_start(struct rproc
> > > *rproc) struct device *dev = priv->dev;
> > >     int ret;
> > >
> > > +   /* write entry point to program counter */
> > > +   writel(rproc->bootaddr, priv->bootreg);
> >
> > What happens on all the other IMX systems where this fix is not
> > needed?  Will they continue to work properly?
>
> Mathieu you are totally correct imx6/imx7 use different addresses they
> boot.
>
> For imx7:
> | On i.MX 7Dual/7Solo, the boot vector for the Cortex-M4 core is located
> | at the start of the OCRAM_S (On Chip RAM - Secure) whose address is
> | 0x0018_0000 from Cortex-A7.
>
> For imx6:
> | The Boot vector for the Cortex-M4 core is located at the start of the
> | TCM_L whose address is 0x007F_8000 from the Cortex-A9. This is a
> | different location than on the i.MX 7Dual/7Solo
>
> But on imx7 0x0 is translated to 0x0018_0000 by imx_rproc_da_to_va, and
> on imx7 0x0 is translated to 0x007F_8000, using imx_rproc_att_imx7d and
> imx_rproc_att_imx6sx respectively.

My point here is that before your patch, this driver was running on
IMX platforms.  How does your work impact existing platforms that are
booting properly?

>
> I have no information about IMX8 (i have found none available
> publicity), but should be the same as Cortex-M boots from 0x0.
>
> >
> > > +
> > >     ret = regmap_update_bits(priv->regmap, dcfg->src_reg,
> > >                              dcfg->src_mask, dcfg->src_start);
> > >     if (ret)
> > >             dev_err(dev, "Failed to enable M4!\n");
> > >
> > > +   dev_info(&rproc->dev, "Started from 0x%x\n",
> > > rproc->bootaddr); +
> > >     return ret;
> > >  }
> > >
> > > @@ -182,6 +190,9 @@ static int imx_rproc_stop(struct rproc *rproc)
> > >     if (ret)
> > >             dev_err(dev, "Failed to stop M4!\n");
> > >
> > > +   /* clear entry points */
> > > +   writel(0, priv->bootreg);
> > > +
> > >     return ret;
> > >  }
> > >
> > > @@ -243,7 +254,8 @@ static void *imx_rproc_da_to_va(struct rproc
> > > *rproc, u64 da, int len) static const struct rproc_ops
> > > imx_rproc_ops = { .start            = imx_rproc_start,
> > >     .stop           = imx_rproc_stop,
> > > -   .da_to_va       = imx_rproc_da_to_va,
> > > +   .da_to_va       = imx_rproc_da_to_va,
> > > +   .get_boot_addr  = rproc_elf_get_boot_addr,
> >
> > How is this useful?  Sure it will set rproc->bootaddr in
> > rproc_fw_boot() but what good does that do when it is invariably set
> > again in imx_rproc_start() ?
> >
> > >  };
> > >
> > >  static int imx_rproc_addr_init(struct imx_rproc *priv,
> > > @@ -360,6 +372,8 @@ static int imx_rproc_probe(struct
> > > platform_device *pdev) goto err_put_rproc;
> > >     }
> > >
> > > +   priv->bootreg = imx_rproc_da_to_va(rproc, IMX_BOOT_PC,
> > > sizeof(u32)); +
> > >     /*
> > >      * clk for M4 block including memory. Should be
> > >      * enabled before .start for FW transfer.
> > > --
> > > 2.25.1
> > >
>
