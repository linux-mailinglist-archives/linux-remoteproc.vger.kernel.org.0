Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 499F71AE5B7
	for <lists+linux-remoteproc@lfdr.de>; Fri, 17 Apr 2020 21:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730368AbgDQTV7 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 17 Apr 2020 15:21:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728192AbgDQTV7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 17 Apr 2020 15:21:59 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 106B3C061A0C
        for <linux-remoteproc@vger.kernel.org>; Fri, 17 Apr 2020 12:21:59 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id z6so1304255plk.10
        for <linux-remoteproc@vger.kernel.org>; Fri, 17 Apr 2020 12:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zMiXOyiLL5u4PWujbjCmvRqsaMSoEDouVZ76G40OsaI=;
        b=HOiEvn1CydEmRhsVyHkWxtwxyhRBVsz7FG8B3D11JoSSKOkTdYpUxLwVzX+cVt5lJz
         NaNF3KChUSzVBLCGZkljHGR1IQ0eijL0VDieRE3Fp2vp1N7ISY//759ujAneqrpH8yrR
         5ZO6ifVnydwKmU2A7i59lmaLzKI68y1+ko1vKsBwJ0J+0BPTOc32FSzercDDxGkdaIl0
         d/a/9x89kuSakmVgjCmIQkVWTGg3NCuE3DPRsx9vqEAkurk8keqaPatIf0Xmmb5+U3S4
         nkV2fovh4MJPftXgcSEMHaXwYVEafC4nBqtu+aUcR38/7kY8WYARpmJtvxlcZTC4ldQA
         yRVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zMiXOyiLL5u4PWujbjCmvRqsaMSoEDouVZ76G40OsaI=;
        b=Boj2vHDjdfLhqQWCXxTFznqk+z6mRChWkgjjE3rb3AXl5SEB1LLv0dWyNjFjCsNQlO
         hCT3mgStdy7mcDO48alYsAK63TYOndxfX6QoECo4N1h+1EFaTA1cTRRlEr4diPxA9bJw
         WP97QwVTlEQRpCTEe97JGePYa6mjn4yWioE8AkeYLvZoa/zB1Y+Ry4iMncTAvKCEMjiu
         KbYiTqbVIQR2svMupQDsLu79WTtsknhZ09HglE7e2jy6RYCz9Yq7vCBk6Z9hYH5tDXOj
         Dle/WrnYG15eFErYdMydQa2ROJDQqJk/YahYyolJkYNhsDx0UmolZQRgaEJIVRNJX7Tl
         eJEQ==
X-Gm-Message-State: AGi0PuYwyENwfMsmYDCQtEfgWnMgIzDps459vhxkEMvarsWZ/zj7tOz5
        ON1wQQIm9A76tQezZceOT12Nzw==
X-Google-Smtp-Source: APiQypLCZ2gSD93SLEZLZ1nDN2rC1wWCt+YehOgoKcmEhMz8hMDxzJBnTZh3xOSbkmhbkcT/lDedfw==
X-Received: by 2002:a17:902:6ac7:: with SMTP id i7mr4663865plt.116.1587151318406;
        Fri, 17 Apr 2020 12:21:58 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id nu13sm6551802pjb.22.2020.04.17.12.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 12:21:57 -0700 (PDT)
Date:   Fri, 17 Apr 2020 13:21:55 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Peng Fan <peng.fan@nxp.com>, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-imx@nxp.com
Subject: Re: [PATCH 2/2] remoteproc: use filesz as backup when translate
 memsz fail
Message-ID: <20200417192155.GA6797@xps15>
References: <1586420572-28353-1-git-send-email-peng.fan@nxp.com>
 <1586420572-28353-2-git-send-email-peng.fan@nxp.com>
 <20200410012226.GV20625@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200410012226.GV20625@builder.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Apr 09, 2020 at 06:22:26PM -0700, Bjorn Andersson wrote:
> On Thu 09 Apr 01:22 PDT 2020, Peng Fan wrote:
> 
> > Since we no need memset if memsz is larger than filesz, we could
> > use filesz for the da to va translation when memsz translation fail.
> > 
> 
> To me this implies that the firmware has a segment that's larger than
> the memory that it's going to run in. I think even if we're not writing
> to the entire memsz, asking da_to_va for the entire memsz provides a
> valuable sanity check.
> 
> Regards,
> Bjorn
> 
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/remoteproc/remoteproc_elf_loader.c | 12 ++++++++++--
> >  1 file changed, 10 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
> > index cc50fe70d50c..74d425a4b34c 100644
> > --- a/drivers/remoteproc/remoteproc_elf_loader.c
> > +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> > @@ -229,8 +229,16 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
> >  		if (!ptr) {
> >  			dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
> >  				memsz);
> > -			ret = -EINVAL;
> > -			break;
> > +
> > +			ptr = rproc_da_to_va(rproc, da, filesz);
> > +			if (!ptr) {
> > +				dev_err(dev,
> > +					"bad phdr da 0x%llx mem 0x%llx\n",
> > +					da, filesz);
> > +				ret = -EINVAL;
> > +				break;
> > +			}
> > +

Adding to Bjorn's comment, I think if rproc_da_to_va() fails with memsz but
succeeds with filesz something went wrong with how memory was laid out in the
DT or the ELF resources.  To me this patch offers the wrong solution - the
focus should be on why rproc_da_to_va() fails.

Thanks,
Mathieu  

> >  		}
> >  
> >  		/* put the segment where the remote processor expects it */
> > -- 
> > 2.16.4
> > 
