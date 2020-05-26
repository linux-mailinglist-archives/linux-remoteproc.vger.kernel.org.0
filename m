Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A19231A4D59
	for <lists+linux-remoteproc@lfdr.de>; Sat, 11 Apr 2020 03:55:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726687AbgDKBzP (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 10 Apr 2020 21:55:15 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:33491 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726671AbgDKBzP (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 10 Apr 2020 21:55:15 -0400
Received: by mail-pg1-f195.google.com with SMTP id d17so1733485pgo.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 10 Apr 2020 18:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=E2bgb+oAffEcAeqUQQsolpBF7Sog6SMgq/QFxjAFZ7E=;
        b=m4puwzcBIV/VTFWnJGyENhqTPmhh4XIOMy47RIuxV3TKzVlyumWFjMN9HtMR74j2f2
         +j8ruJBuoZ0lLzLmd9NxBi9pF4uNP+PD+d4mnP3TwvGQ5ElZ7lvJ/HDm5dfPKTz0do70
         dIpHKSiAG8+AwMyNZY1ttFNPS7rGbeicOe20eIBQOVGifuXE/qlSfZZpIr6UMgYQZIYj
         EHGn+jkROhii88gOcXrQoTbb6Pp4/2zcfW5+wosyvg04Vk77na1lBARiI++l9oLnBMNo
         h84Jx3Q4m9J2sDA0/szn6lX+oiUtqH0cZtoHdCrL7NG8jOjElCbm5DbCRTzUr64xt6ew
         gqNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=E2bgb+oAffEcAeqUQQsolpBF7Sog6SMgq/QFxjAFZ7E=;
        b=W6mtW+gMiqJnnQaL5nVRqLZHFzIDfWQrx4thjKhdzz6NxqO6A/5bToQmm7SE2y7Nxv
         CNtzJbAn4Nw6U/wikl3mgt9j2M3skYhweVC14g/VlBulQPiMsL9338y05sZ1G284EV+x
         aEGfoygAnd5ANqhBXBcANCzlab1DdVihIxJ+OrYCjmwUuLt5g86sx5jR/5xMcYiWvgQA
         7DXaXjy25Dxb2bz9CP2zLab9DUMccLGemDM6aYcV3E1YxHY2aDCBlnYHqEoq79tP3TW9
         fFyMiZmDKHHWax6DJlpPjT+mpky1ae3OFWUbF+3YTY/lL7N+yCK6gPItT9RgYn3Fum06
         gqgQ==
X-Gm-Message-State: AGi0PubiS6R3GASsWBrQeM6ftlykoIEOWq8fHk8NaP0DTU6urnm7RB00
        1Uoau80Dc+BRTgFDw+Ru9LrpOA==
X-Google-Smtp-Source: APiQypIgjtE6PdNfV7oGEV7Cgn7+5O3AAkZ7ITrRrIrJTS4dpVhLJsBaF7xVSidhIcDKmzrrwznL5w==
X-Received: by 2002:a63:4625:: with SMTP id t37mr6712802pga.83.1586570113100;
        Fri, 10 Apr 2020 18:55:13 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id m11sm2830542pfh.57.2020.04.10.18.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 18:55:12 -0700 (PDT)
Date:   Fri, 10 Apr 2020 18:55:22 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Peng Fan <peng.fan@nxp.com>
Cc:     "ohad@wizery.com" <ohad@wizery.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH 2/2] remoteproc: use filesz as backup when translate
 memsz fail
Message-ID: <20200411015522.GK576963@builder.lan>
References: <1586420572-28353-1-git-send-email-peng.fan@nxp.com>
 <1586420572-28353-2-git-send-email-peng.fan@nxp.com>
 <20200410012226.GV20625@builder.lan>
 <AM0PR04MB4481B8AA8ADB836ED8398ADF88DE0@AM0PR04MB4481.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM0PR04MB4481B8AA8ADB836ED8398ADF88DE0@AM0PR04MB4481.eurprd04.prod.outlook.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu 09 Apr 18:32 PDT 2020, Peng Fan wrote:

> Hi Bjorn,
> 
> > Subject: Re: [PATCH 2/2] remoteproc: use filesz as backup when translate
> > memsz fail
> > 
> > On Thu 09 Apr 01:22 PDT 2020, Peng Fan wrote:
> > 
> > > Since we no need memset if memsz is larger than filesz, we could use
> > > filesz for the da to va translation when memsz translation fail.
> > >
> > 
> > To me this implies that the firmware has a segment that's larger than the
> > memory that it's going to run in. I think even if we're not writing to the entire
> > memsz, asking da_to_va for the entire memsz provides a valuable sanity
> > check.
> 
> da_to_va implies that Linux should have the va map to da. However
> that will be case that Linux is not able to touch all da, it only able touch
> half. Then Linux should also map all da?
> 

So you have memory described in your ELF that can only be accessed by
the remoteproc? And this memory is covered by segments of type PT_LOAD?

What's your strategy for making sure that filesz stays within the
boundaries that the ELF loader is allowed to touch?

Regards,
Bjorn

> Thanks,
> Peng.
> 
> > 
> > Regards,
> > Bjorn
> > 
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > ---
> > >  drivers/remoteproc/remoteproc_elf_loader.c | 12 ++++++++++--
> > >  1 file changed, 10 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/remoteproc/remoteproc_elf_loader.c
> > > b/drivers/remoteproc/remoteproc_elf_loader.c
> > > index cc50fe70d50c..74d425a4b34c 100644
> > > --- a/drivers/remoteproc/remoteproc_elf_loader.c
> > > +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> > > @@ -229,8 +229,16 @@ int rproc_elf_load_segments(struct rproc *rproc,
> > const struct firmware *fw)
> > >  		if (!ptr) {
> > >  			dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
> > >  				memsz);
> > > -			ret = -EINVAL;
> > > -			break;
> > > +
> > > +			ptr = rproc_da_to_va(rproc, da, filesz);
> > > +			if (!ptr) {
> > > +				dev_err(dev,
> > > +					"bad phdr da 0x%llx mem 0x%llx\n",
> > > +					da, filesz);
> > > +				ret = -EINVAL;
> > > +				break;
> > > +			}
> > > +
> > >  		}
> > >
> > >  		/* put the segment where the remote processor expects it */
> > > --
> > > 2.16.4
> > >
