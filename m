Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FDB72B804F
	for <lists+linux-remoteproc@lfdr.de>; Wed, 18 Nov 2020 16:23:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727228AbgKRPXC (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 18 Nov 2020 10:23:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726449AbgKRPXB (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 18 Nov 2020 10:23:01 -0500
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB919C061A48
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Nov 2020 07:22:59 -0800 (PST)
Received: by mail-qk1-x741.google.com with SMTP id v143so2130823qkb.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Nov 2020 07:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GH9Xy8QAdPbukrPXbHMdGuCbNQSmg+d15O0OpK6oPDU=;
        b=h4TN/jcVvOVqit9i6UFM5UXHAzRVbr+06IwvK4j7baLs601eobWK3ybyjMbrdbYMQf
         AX+dAZ5qI7pfTTmC76wPgeNmBYoV0CpRZPjq6g6BDLCqtd5hmPnj9GmE/eC6cJsPtzQd
         boy6lKrCejDjUqOQZ7WP2Z8uUA39a6truy8ZAUhgs7UZ/0AKHFOlXW6wob7FLYNDMOUX
         zPo7e2O2xtt5vpuJpzyyyiAupzr/DoFUwnX2mLnmRelrTmPDbGddIgS1dZhEMoi0ZZCu
         FbKO7mTedcHBsOBYDH9tJnDdUkaCnmGWJb5ZQAyE6bUd835SdC2n+q0S+ZmGiZKpEsGx
         nbxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GH9Xy8QAdPbukrPXbHMdGuCbNQSmg+d15O0OpK6oPDU=;
        b=dcFNHvGDxOGGGuxw0SHqQWAZQxtU5lhqN+LaglXmHfLYWiGleO3MWm/1FygAj1MMWw
         HrVP+YB9x4wAPO3hSHylMcS2Z5Y7r15DgQ0Cj9SF0Z+tG6dAfPsO7k5HMJrMugWXuzB5
         DAOvxoPZ1z4xvTcm6uIAzBgXwtFDviS98+3CTtE4L5DSlOXiHzZKrzIUxXoxiLYGWuwj
         9E2beRdDgNM2eC5skTo8b2UhMVRqyhTThasnJIYa7RU+zW6Vh1O4q7aszXmSCQRVaebG
         FyUGm5BEI7yA1UgvSf3V985/Xl8wAyo8GguOsEfIo5wyzYj+EJ10ZeIUc2z1mBHWewN6
         cX5w==
X-Gm-Message-State: AOAM530h/2n4X9PAUAviKCC8btY95tmYDErTF4gCtM9BhTC6nyk3g6wV
        ZX9a25Dd+9lMT5DmIRgLPrEF2C+p94Rt4hZmx5wrpw==
X-Google-Smtp-Source: ABdhPJwIC91BDC5Utr8V4WPjI/sBwnHGPwlWEDaBk3pFF3i5hnFhC9cwQPrgbPvO3III8iQXHYaNfWzNGZJQ4M2yTVc=
X-Received: by 2002:a37:2782:: with SMTP id n124mr5438013qkn.498.1605712979009;
 Wed, 18 Nov 2020 07:22:59 -0800 (PST)
MIME-Version: 1.0
References: <20201114084613.13503-1-grzegorz.jaszczyk@linaro.org>
 <20201114084613.13503-2-grzegorz.jaszczyk@linaro.org> <20201116152804.GA1679588@bogus>
In-Reply-To: <20201116152804.GA1679588@bogus>
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Date:   Wed, 18 Nov 2020 16:22:47 +0100
Message-ID: <CAMxfBF7k9ew1C6VaS8u-u-vr60gUGRYmrEu=ic67Op+udvKu7Q@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: remoteproc: Add binding doc for PRU
 cores in the PRU-ICSS
To:     Rob Herring <robh@kernel.org>
Cc:     linux-omap@vger.kernel.org, Ohad Ben Cohen <ohad@wizery.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Roger Quadros <rogerq@ti.com>,
        "Bajjuri, Praneeth" <praneeth@ti.com>,
        "Anna, Suman" <s-anna@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Rob

On Mon, 16 Nov 2020 at 16:28, Rob Herring <robh@kernel.org> wrote:
>
> On Sat, 14 Nov 2020 09:46:08 +0100, Grzegorz Jaszczyk wrote:
> > From: Suman Anna <s-anna@ti.com>
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
> > This patch adds the bindings for these PRU cores. The binding covers the
> > OMAP architecture SoCs - AM33xx, AM437x and AM57xx; Keystone 2 architecture
> > based 66AK2G SoC; and the K3 architecture based SoCs - AM65x and J721E. The
> > Davinci based OMAPL138 SoCs will be covered in a future patch.
> >
> > Co-developed-by: Roger Quadros <rogerq@ti.com>
> > Signed-off-by: Roger Quadros <rogerq@ti.com>
> > Signed-off-by: Suman Anna <s-anna@ti.com>
> > Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> > ---
> >  .../bindings/remoteproc/ti,pru-rproc.yaml     | 214 ++++++++++++++++++
> >  1 file changed, 214 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml
> >
>
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml:37:6: [warning] wrong indentation: expected 6 but found 5 (indentation)
> ./Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml:92:2: [warning] wrong indentation: expected 2 but found 1 (indentation)
>
> dtschema/dtc warnings/errors:
>
>
> See https://patchwork.ozlabs.org/patch/1400241
>
> The base for the patch is generally the last rc1. Any dependencies
> should be noted.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit.

Sorry for that - I've run dt_binding_check which completes without any
warnings/errors but I didn't had yamllint installed. I will fix
mentioned warnings for v2.

Best regards,
Grzegorz
