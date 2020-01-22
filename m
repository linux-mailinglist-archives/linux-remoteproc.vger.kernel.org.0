Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 289C0145C5B
	for <lists+linux-remoteproc@lfdr.de>; Wed, 22 Jan 2020 20:20:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726780AbgAVTUV (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 22 Jan 2020 14:20:21 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:40043 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726135AbgAVTUV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 22 Jan 2020 14:20:21 -0500
Received: by mail-pl1-f194.google.com with SMTP id s21so189783plr.7
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Jan 2020 11:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mpnp2dBUwgiSXJqBkhUdFPkzPC82dAX2Dn/bzDab9OI=;
        b=TwoKubR7jNDC4FclY67lUleRt7BkY0+OB6iyNEzor/uNZSPiIrXIXbVINxc/qzjB2/
         orFLFxkbQBij/x+q2bSzp8dFpk6zF/y2rOm3kjZKMPKMe9foOSjjaogA/6DtOoLLoPDo
         CfJcIuhiXScG3eQdaxDxRwz8XaAJgBAUkgMuvw3WKcPAzFEzATmkX+2hI57agzEyDhYe
         Zl7X2nlFkxbyzB3rhlRCBTg24HqN6LGz740918w1ctTE460zXSILedH6AE2gmqgvj0md
         42Ihe9mcJaSvEd0ZCW01Xs7bOgTgfuvM03QU36WVyywF3QvGmk6wgRAZsqc98UC63LXM
         d2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mpnp2dBUwgiSXJqBkhUdFPkzPC82dAX2Dn/bzDab9OI=;
        b=TGodVm9JXZDSj2SbEe9CP1WsEdNZYtVluUn9ooBI5P8dTtA5PNqw3VPWH+corkgXb0
         aE/I72TXXK/aYsroX3nna/+Epi1zjcZ7JCM/Yb6+wF+vX8mkbRDIzgZeHGNKJ3KRboCh
         tnIrHMg8sVtTtq3j8RqwgqWkenBD3ZaV3Xvx+Ighur4+bLzf6I7RSsb613OCDhWTLtyt
         u933OzuSQo6TiqAgDsZ6NNh3M1JHjRtZjIpgNNsBvctkrlUP6+j+9RnAQONTKMTtfBvk
         QhlIUK2Ey6jBMpqIGE9wwjQIBG+zH2AP3fIwpNR1IqfKoV4KXUMbyFK7DrtQZDQb+HkC
         TB4w==
X-Gm-Message-State: APjAAAVHR0Yc1HGGcokcpXQhYfkinQ3geTG4kj+FVKfxEpqJlbUM9KQo
        f4O2fUD5BtHliuHyPEb9XOeQeQ==
X-Google-Smtp-Source: APXvYqxspwypdYRSl7cOxJoNSmsNgl+draPEhXEg+oHAk4xjoVtPB+jwjiWlRB4uz0kbtwFrb1BI9Q==
X-Received: by 2002:a17:902:7291:: with SMTP id d17mr12134051pll.227.1579720820090;
        Wed, 22 Jan 2020 11:20:20 -0800 (PST)
Received: from ripper (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a15sm49191872pfh.169.2020.01.22.11.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 11:20:19 -0800 (PST)
Date:   Wed, 22 Jan 2020 11:19:46 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: Re: [PATCH v2 2/8] remoteproc: qcom: Introduce driver to store pil
 info in IMEM
Message-ID: <20200122191946.GA3261042@ripper>
References: <20191227053215.423811-1-bjorn.andersson@linaro.org>
 <20191227053215.423811-3-bjorn.andersson@linaro.org>
 <20200110211846.GA11555@xps15>
 <20200122020234.GT1511@yoga>
 <CANLsYkykgpLAQqG3Tk73HFR9+Uadr2caiBx-6op5Cyv4BBcPFA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYkykgpLAQqG3Tk73HFR9+Uadr2caiBx-6op5Cyv4BBcPFA@mail.gmail.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed 22 Jan 11:04 PST 2020, Mathieu Poirier wrote:

> On Tue, 21 Jan 2020 at 19:02, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Fri 10 Jan 13:18 PST 2020, Mathieu Poirier wrote:
> > > On Thu, Dec 26, 2019 at 09:32:09PM -0800, Bjorn Andersson wrote:
> > [..]
> > > > diff --git a/drivers/remoteproc/qcom_pil_info.c b/drivers/remoteproc/qcom_pil_info.c
> > > > new file mode 100644
> > > > index 000000000000..b0897ae9eae5
> > > > --- /dev/null
> > > > +++ b/drivers/remoteproc/qcom_pil_info.c
> > > > @@ -0,0 +1,150 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > +/*
> > > > + * Copyright (c) 2019 Linaro Ltd.
> > > > + */
> > > > +#include <linux/module.h>
> > > > +#include <linux/kernel.h>
> > > > +#include <linux/of.h>
> > > > +#include <linux/platform_device.h>
> > > > +#include <linux/mutex.h>
> > > > +#include <linux/regmap.h>
> > > > +#include <linux/mfd/syscon.h>
> > > > +#include <linux/slab.h>
> > >
> > > These should be in alphabetical order if there is no depencencies
> > > between them, something checkpatch complains about.
> > >
> >
> > Of course.
> >
> > > > +
> > > > +struct pil_reloc_entry {
> > > > +   char name[8];
> > >
> > > Please add a #define for the name length and reuse it in qcom_pil_info_store()
> > >
> >
> > Ok
> >
> > [..]
> > > > +void qcom_pil_info_store(const char *image, phys_addr_t base, size_t size)
> > > > +{
> > > > +   struct pil_reloc_entry *entry;
> > > > +   int idx = -1;
> > > > +   int i;
> > > > +
> > > > +   mutex_lock(&reloc_mutex);
> > > > +   if (!_reloc)
> > >
> > > Since it is available, I would use function qcom_pil_info_available().  Also
> > > checkpatch complains about indentation problems related to the 'if' condition
> > > but I can't see what makes it angry.
> > >
> >
> > Sure thing, and I'll double check the indentation.
> >
> > > > +           goto unlock;
> > > > +
> > > > +   for (i = 0; i < PIL_INFO_ENTRIES; i++) {
> > > > +           if (!_reloc->entries[i].name[0]) {
> > > > +                   if (idx == -1)
> > > > +                           idx = i;
> > > > +                   continue;
> > > > +           }
> > > > +
> > > > +           if (!strncmp(_reloc->entries[i].name, image, 8)) {
> > > > +                   idx = i;
> > > > +                   goto found;
> > > > +           }
> > > > +   }
> > > > +
> > > > +   if (idx == -1) {
> > > > +           dev_warn(_reloc->dev, "insufficient PIL info slots\n");
> > > > +           goto unlock;
> > >
> > > Given how this function is used in the next patch I think an error should be
> > > reported to the caller.
> > >
> >
> > Just to clarify, certain global errors will cause the entire device to
> > be reset and allow memory contents to be extracted for analysis in post
> > mortem tools. This patch ensures that this information contains
> > (structured) information about where each remote processor is loaded.
> > Afaict the purpose of propagating errors from this function would be for
> > the caller to abort the launching of a remote processor.
> >
> > I think it's better to take the risk of having insufficient data for the
> > post mortem tools than to fail booting a remote processor for a reason
> > that won't affect normal operation.
> 
> I understand the reasoning.  In that case it is probably best to let
> the caller decide what to do with the returned error than deal with it
> locally, especially since this is an exported function.  When using
> qcom_pil_info_store(), I would write a comment that justifies the
> reason for ignoring the return value (what you have above is quite
> good).  Otherwise it is just a matter of time before automated tools
> pickup on the anomaly and send patches to fix it.
> 

You're right, moving the decision to the remoteproc drivers will result
in the decision being implemented in the right place. I will respin it
accordingly.

Thanks!
Bjorn
