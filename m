Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA0912CF079
	for <lists+linux-remoteproc@lfdr.de>; Fri,  4 Dec 2020 16:12:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730289AbgLDPMN (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 4 Dec 2020 10:12:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726276AbgLDPMN (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 4 Dec 2020 10:12:13 -0500
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDAC8C061A4F
        for <linux-remoteproc@vger.kernel.org>; Fri,  4 Dec 2020 07:11:32 -0800 (PST)
Received: by mail-qt1-x843.google.com with SMTP id o1so4109268qtp.5
        for <linux-remoteproc@vger.kernel.org>; Fri, 04 Dec 2020 07:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CTZE5KYHYdCtlR64X4cdwkLGSERgZtg1bRZFdAZq1Jo=;
        b=oo3ypHsXZFXMgirMzks9ExPqQMPDJAFZS9OrDgQfyEK6g02cm8ZZBSC6uXO9ABvjsF
         D7RmT6gvfSXp0rwl4EsPfLix2qnmrSDmgGPUM5oIu3ii7NgDH+G0vdvo6dhYWpAi6o/o
         AVf0wneYfo/YQZoxUKRrPCQZm+ub/pUh2Ns5GRMW26EgDPETzbOoOV0AR+9gaKBU2ZKP
         eeluI5XnEQ72v4drP+BWPooR7N2v0T1phoETXPVLXKl2uamKh1It2irIhZU+vRWoh6BI
         TvIHbKms6AJmoiIVvM0m6wMB0vMdDi0QsdNygHWxFrm5MDgIzmryNkccH+XJc5hHWj9w
         kY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CTZE5KYHYdCtlR64X4cdwkLGSERgZtg1bRZFdAZq1Jo=;
        b=dzFdYINHSkcYkVuGVvFiKrM90iTdXrK3PuF1cQdHuNYgXsr80xBxA4Bh+XK6B3tnB8
         U+UjeiqW5IstgUaMDOI1b/EVrgyuPI+7l/OcOCtobjiR+gTuftjZwOwlS1kq+IL/arRl
         RcjHX+KWIyvXcbEJiCMs99vfwLc1R2H6/PTuvm2xcKA4ua68LruG0o17h2jQIYw3Pbsr
         D29PNFWB4b4D3hw+2PN6Ftdrr7UJWwxdHMLcPgHf7NzPGSzWUsl39JfvNzMPHnMdfaK9
         sJizWdMv3HpuWFfVKDzjF8UynHHxlrZFAC4ecDifwNOJCPKG61ocvtdcXsvSfTcJI2zc
         N2oQ==
X-Gm-Message-State: AOAM532vjdo98dOcbAxybpeU9Oq5g9jcc1I1pIdq5uU9qhVt1aUS4T+t
        wHkGnpNB5BSF90fb6wH8KH1o63TIEzf68xiCrZkBh12VPtn2lQ==
X-Google-Smtp-Source: ABdhPJym3Hu5283k/Rt6jj2+IHVjFg5AONLLc7sr3X25XFBImmQ13ymUKuacYVhjXLBcoiQQtWhr1VODUnAxILBkFps=
X-Received: by 2002:aed:3c42:: with SMTP id u2mr9224643qte.159.1607094692010;
 Fri, 04 Dec 2020 07:11:32 -0800 (PST)
MIME-Version: 1.0
References: <20201119140850.12268-1-grzegorz.jaszczyk@linaro.org> <d31a38a2-940c-2ce6-b496-4b4ac2fbe08e@ti.com>
In-Reply-To: <d31a38a2-940c-2ce6-b496-4b4ac2fbe08e@ti.com>
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Date:   Fri, 4 Dec 2020 16:11:20 +0100
Message-ID: <CAMxfBF7yWY8_xGXa_SX4Cy1sgoY+f9OKoHGVyQYeP5yvNUdKEw@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Add a PRU remoteproc driver
To:     Suman Anna <s-anna@ti.com>
Cc:     Ohad Ben Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Bajjuri, Praneeth" <praneeth@ti.com>,
        Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Suman,

On Fri, 4 Dec 2020 at 16:05, Suman Anna <s-anna@ti.com> wrote:
>
> Hi Greg,
>
> On 11/19/20 8:08 AM, Grzegorz Jaszczyk wrote:
> > Hi All,
> >
> > The Programmable Real-Time Unit and Industrial Communication Subsystem
> > (PRU-ICSS or simply PRUSS) on various TI SoCs consists of dual 32-bit
> > RISC cores (Programmable Real-Time Units, or PRUs) for program execution.
> >
> > The K3 AM65x amd J721E SoCs have the next generation of the PRU-ICSS IP,
> > commonly called ICSSG. The ICSSG IP on AM65x SoCs has two PRU cores,
> > two auxiliary custom PRU cores called Real Time Units (RTUs). The K3
> > AM65x SR2.0 and J721E SoCs have a revised version of the ICSSG IP, and
> > include two additional custom auxiliary PRU cores called Transmit PRUs
> > (Tx_PRUs).
> >
> > This series contains the PRUSS remoteproc driver together with relevant
> > dt-binding. This is the 3rd foundation component for PRUSS subsystem, the
> > previous two were already merged and can be found under:
> > 1) drivers/soc/ti/pruss.c
> >    Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
> > 2) drivers/irqchip/irq-pruss-intc.c
> >    Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml
> >
> > The following is a v2 version of the series. Please see the individual patches
> > for exact changes in each patch, following are the main changes from v1:
> > - Patch #1: fix two yamllint warnings.
> > - Patch #2: address Suman comments: minor style improvements and fix for
> >           optional resource table handling (moved from patch #3).
> > - Patch #3: address Suman comment: minor style, comments and trace improvements
> >           (no functional changes).
> > - Patch #4: No changes.
> > - Patch #5: Update documentation of pru_rproc_memcpy() function and is_k3 flag.
> > - Patch #6: No changes.
> >
> > Best regards,
> > Grzegorz
> >
> > Grzegorz Jaszczyk (1):
> >   remoteproc/pru: Add support for PRU specific interrupt configuration
> >
> > Suman Anna (5):
> >   dt-bindings: remoteproc: Add binding doc for PRU cores in the PRU-ICSS
> >   remoteproc/pru: Add a PRU remoteproc driver
> >   remoteproc/pru: Add pru-specific debugfs support
> >   remoteproc/pru: Add support for various PRU cores on K3 AM65x SoCs
> >   remoteproc/pru: Add support for various PRU cores on K3 J721E SoCs
>
> One minor change for v3 when you repost to address Mathieu's comments, can you
> please adjust the patch titles to use
> "remoteproc: pru:" instead following the latest convention.

Sure - I will do that.
Thank you,
Grzegorz

>
> Thanks,
> Suman
>
> >
> >  .../bindings/remoteproc/ti,pru-rproc.yaml     | 214 +++++
> >  drivers/remoteproc/Kconfig                    |  12 +
> >  drivers/remoteproc/Makefile                   |   1 +
> >  drivers/remoteproc/pru_rproc.c                | 877 ++++++++++++++++++
> >  drivers/remoteproc/pru_rproc.h                |  46 +
> >  5 files changed, 1150 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml
> >  create mode 100644 drivers/remoteproc/pru_rproc.c
> >  create mode 100644 drivers/remoteproc/pru_rproc.h
> >
>
