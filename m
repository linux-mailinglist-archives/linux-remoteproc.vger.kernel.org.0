Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 591B81A4D57
	for <lists+linux-remoteproc@lfdr.de>; Sat, 11 Apr 2020 03:50:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbgDKBu5 (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 10 Apr 2020 21:50:57 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:46424 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726648AbgDKBu5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 10 Apr 2020 21:50:57 -0400
Received: by mail-pf1-f194.google.com with SMTP id q3so1774303pff.13
        for <linux-remoteproc@vger.kernel.org>; Fri, 10 Apr 2020 18:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KxY0VWK9cArwLCdvi0SMmrAyFvAuH7sIH9MleJceTb8=;
        b=DINJ2KJDZKYU5ShzxJjLmHHs5H5clFU2TxLPNoy7wy9VtwKGqGAy13gqJazDVkbruO
         xs8FT54iofBhKh2Y8ieS/wp078a2GAOjrJiCbcHfUQH3/BJ+sL55s2cbA9rDFSlF49k2
         ngYbaCz4w/QO56/so2Oiargw9LtoXsjXu+dQlGzsI6V9cZTQD93YbnHcGZHKxh5RdU+E
         YbqheYjKoZ9cUPuZWWJ0LtSKiIevgBpHha6cVNU5H2OWhiL+/OYi3YrJXNIukHq1KQgC
         QORRH3GG/JLKmdg/X9cdSbCwAQiJXerpH7yfbI45qEV/Luca2GgK3GA17kjkx+jIfSo0
         m0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KxY0VWK9cArwLCdvi0SMmrAyFvAuH7sIH9MleJceTb8=;
        b=cK2KXteufwnWt1TxZHe01av1p5ApF6t/BW0ysRw9SHYTac0BylHepyMr10LIqMuL8S
         SBQmZe++JEHHMCyBQAjGKvXIbQvcDakE2rTmyp7s6CB5xgOFzfPGYyk5K/sZX8/KnYV0
         4FLzGE3kOFvC0U7sIVeRgKYBqCZTRZUrb0b2y6j8L3l5QKj1tSzU/ImXz2jCroufl8oS
         P/+VjrWmk4Q22x72LaaEf3mKrQXmWSjLrjG8Qm27AMImDa2elbRxFXXk9VHbJcqt0Klq
         TB2+qZ09EiGnxbLSAxRHdTm+h1mrgS1/YKRtGZGhUdZuxU82YRc91ka0gpH3RuxEaYyP
         AIgQ==
X-Gm-Message-State: AGi0PuaL46upBhmDIeHRALZmH8pIjMIRiej/JSqlAnfkw9KICWTKIwC7
        1BMgKXGPv4vTOItw/hzSIBN+UQ==
X-Google-Smtp-Source: APiQypIPIJUqmq7II854rJC+3bS/YyJlqJqaS425Nxlj9KZin5YW1sWZHEG6b2QXSKLxKMDuWnrgcQ==
X-Received: by 2002:a62:5cc1:: with SMTP id q184mr7530042pfb.259.1586569854936;
        Fri, 10 Apr 2020 18:50:54 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id w192sm1602655pfc.126.2020.04.10.18.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 18:50:54 -0700 (PDT)
Date:   Fri, 10 Apr 2020 18:51:04 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Peng Fan <peng.fan@nxp.com>
Cc:     "ohad@wizery.com" <ohad@wizery.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH 1/2] remoteproc: drop memset when loading elf segments
Message-ID: <20200411015104.GJ576963@builder.lan>
References: <1586420572-28353-1-git-send-email-peng.fan@nxp.com>
 <20200410012034.GU20625@builder.lan>
 <AM0PR04MB44816C59A9BE84465AC8F2C388DE0@AM0PR04MB4481.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM0PR04MB44816C59A9BE84465AC8F2C388DE0@AM0PR04MB4481.eurprd04.prod.outlook.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu 09 Apr 18:29 PDT 2020, Peng Fan wrote:

> Hi Bjorn,
> 
> > Subject: Re: [PATCH 1/2] remoteproc: drop memset when loading elf
> > segments
> > 
> > On Thu 09 Apr 01:22 PDT 2020, Peng Fan wrote:
> > 
> > > To arm64, "dc      zva, dst" is used in memset.
> > > Per ARM DDI 0487A.j, chapter C5.3.8 DC ZVA, Data Cache Zero by VA,
> > >
> > > "If the memory region being zeroed is any type of Device memory, this
> > > instruction can give an alignment fault which is prioritized in the
> > > same way as other alignment faults that are determined by the memory
> > > type."
> > >
> > > On i.MX platforms, when elf is loaded to onchip TCM area, the region
> > > is ioremapped, so "dc zva, dst" will trigger abort.
> > >
> > > Since memset is not strictly required, let's drop it.
> > >
> > 
> > This would imply that we trust that the firmware doesn't expect remoteproc
> > to zero out the memory, which we've always done. So I don't think we can say
> > that it's not required.
> 
> Saying an image runs on a remote core needs Linux to help zero out BSS section,
> this not make sense to me.

Maybe not, but it has always done it, so if there's firmware out there
that depends on it such change would break them..

> My case is as following, I need to load section 7 data.
> I no need to let remoteproc to memset section 8/9/10/11/12, the firmware itself
> could handle that. Just because the memsz is larger than filesz, remoreproc must
> memset?

By having a PT_LOAD segment covering these I think it's reasonable to
assume that the ELF loader should be able to touch the associated
memory.

> Section Headers:
>   [Nr] Name              Type            Addr     Off    Size   ES Flg Lk Inf Al
>   [ 0]                   NULL            00000000 000000 000000 00      0   0  0
>   [ 1] .interrupts       PROGBITS        1ffe0000 010000 000240 00   A  0   0  4
>   [ 2] .resource_table   PROGBITS        1ffe0240 010240 000058 00   A  0   0  1
>   [ 3] .text             PROGBITS        1ffe02a0 0102a0 009ccc 00  AX  0   0 16
>   [ 4] .ARM              ARM_EXIDX       1ffe9f6c 019f6c 000008 00  AL  3   0  4
>   [ 5] .init_array       INIT_ARRAY      1ffe9f74 019f74 000004 04  WA  0   0  4
>   [ 6] .fini_array       FINI_ARRAY      1ffe9f78 019f78 000004 04  WA  0   0  4
>   [ 7] .data             PROGBITS        1fff9240 029240 000084 00  WA  0   0  4
>   [ 8] .ncache.init      PROGBITS        1fff92c4 0292c4 000000 00   W  0   0  1
>   [ 9] .ncache           NOBITS          1fff92c4 0292c4 000a80 00  WA  0   0  4
>   [10] .bss              NOBITS          1fff9d44 0292c4 01f5c0 00  WA  0   0  4
>   [11] .heap             NOBITS          20019304 0292c4 000404 00  WA  0   0  1
>   [12] .stack            NOBITS          20019708 0292c4 000400 00  WA  0   0  1
> 
> > 
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > ---
> > >  drivers/remoteproc/remoteproc_elf_loader.c | 7 ++-----
> > >  1 file changed, 2 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/remoteproc/remoteproc_elf_loader.c
> > > b/drivers/remoteproc/remoteproc_elf_loader.c
> > > index 16e2c496fd45..cc50fe70d50c 100644
> > > --- a/drivers/remoteproc/remoteproc_elf_loader.c
> > > +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> > > @@ -238,14 +238,11 @@ int rproc_elf_load_segments(struct rproc *rproc,
> > const struct firmware *fw)
> > >  			memcpy(ptr, elf_data + offset, filesz);
> > >
> > >  		/*
> > > -		 * Zero out remaining memory for this segment.
> > > +		 * No need zero out remaining memory for this segment.
> > >  		 *
> > >  		 * This isn't strictly required since dma_alloc_coherent already
> > > -		 * did this for us. albeit harmless, we may consider removing
> > > -		 * this.
> > > +		 * did this for us.
> > 
> > In the case of recovery this comment is wrong, we do not
> > dma_alloc_coherent() the carveout during a recovery.
> 
> Isn't the it the firmware's job to memset the region?
> 

I'm not aware of this being a documented requirement, we've always done
it here for them, so removing this call would be a change in behavior.

> > 
> > And in your case you ioremapped existing TCM, so it's never true.
> > 
> > >  		 */
> > > -		if (memsz > filesz)
> > > -			memset(ptr + filesz, 0, memsz - filesz);
> > 
> > So I think you do want to zero out this region. Question is how we do it...
> 
> I have contacted our M4 owners, we no need clear it from Linux side.

And I think _most_ firmware out there, like yours, does clear BSS etc
during initialization.

> We also support booting m4 before booting Linux, at that case, Linux has
> noting to do with memset. It is just I try loading m4 image with Linux,
> and met the issue that memset trigger abort.
> 

Please see the proposal for attaching to already running remoteproc's
from Mathieu. I don't expect that you want to load your PROGBITS either
in this case?

Regards,
Bjorn
