Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3795412720C
	for <lists+linux-remoteproc@lfdr.de>; Fri, 20 Dec 2019 01:12:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726986AbfLTAMk (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 19 Dec 2019 19:12:40 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:42341 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726952AbfLTAMk (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 19 Dec 2019 19:12:40 -0500
Received: by mail-il1-f193.google.com with SMTP id a6so6392992ili.9
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Dec 2019 16:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qs+Sa1+sjdzty0pSCITj5traxewzN9G4gEr6T5j5V9o=;
        b=AB1vxyAhSPg1F6ndqplSaA8FVhn2Lc5356ua92meLm6LyrQ23o1YyQLCVWsOCjkemv
         0RzNk6LZKO//2H5SpazVTDR1nQ66iwWrxj/n56XZZ0+HKXmPQe8/REQkeA1U0pW/bafh
         KzYHlz0UMZ7b0Tx5VoRAm/y1jB8VpibJim9lYR+cHLkWmg4NRR01a0WLTvMXQF+4vgo1
         D4idV7lc60ZDKjrXJfmRsmWCbvnPzLpES3ak6A4m+4xf+ACIyK73384Qn5ERdlwQ6IIm
         /huR3RcIWvtvM+IL7Imwkyev4MyOX2iczJH0B4XTBc0xLsbb4Wzc64qb/9eLgiRSAbxL
         Tx+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qs+Sa1+sjdzty0pSCITj5traxewzN9G4gEr6T5j5V9o=;
        b=ECOdZ4gbYiQdXrKMeBa6jNpzZVpXQZqPhAml5klpdEmvKs/O8Dkn9q2cdiXimQQmoY
         5z8zUOUtwgGTOf/Ow7SiwH0dote20seZktbSqZD2KJo3CqMT4l5bH9jBcPfnqFtJeDgV
         XhgR/HdvNYoYnQFKu1eb0ocOXOkT7shAAPqlXFyYF5b1XfVfywTkCGexDBMjwAV+6UBT
         pOjxGj82Jj3nY6gCzMNx5yArd0T1gG0JvF8tidbuZMNVik+fjaQ7GB2LIan833EMjCE3
         bhiP2VYlBPC6Vl84BATykSeLfLrwS3WL+NAcnnaXw5ssIh3BOay58xuOa1/Y7c86YQ1O
         ZZ5w==
X-Gm-Message-State: APjAAAUJJmwbr4NcV2A1gXECw8jUwjqCDrhXEn96B841TU9wgY2JNvXe
        AY/V9XXMeVA9ZyPK8WGFUHFj19m2u+2boJXTNjs0QA==
X-Google-Smtp-Source: APXvYqwVkT3CPJ6BN3SwzlEKH987cMoOerm9iYmX3wpm0k/KDXdLWFripwK1aX2mpwPSzcGFK+Y/d/WLoT1WAt/xby8=
X-Received: by 2002:a92:1711:: with SMTP id u17mr9937804ill.72.1576800759377;
 Thu, 19 Dec 2019 16:12:39 -0800 (PST)
MIME-Version: 1.0
References: <20191213125537.11509-1-t-kristo@ti.com> <20191213125537.11509-6-t-kristo@ti.com>
 <20191218003815.GC16271@xps15> <5869498f-086c-cea4-edcf-1b75fb22cf22@ti.com>
In-Reply-To: <5869498f-086c-cea4-edcf-1b75fb22cf22@ti.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Thu, 19 Dec 2019 17:12:28 -0700
Message-ID: <CANLsYkz=ZV-AABXq2mSdwKkcdkQgFwStepteFnMBc4j=ahe4Dw@mail.gmail.com>
Subject: Re: [PATCHv3 05/15] remoteproc/omap: Add the rproc ops .da_to_va() implementation
To:     Tero Kristo <t-kristo@ti.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap@vger.kernel.org, Suman Anna <s-anna@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, 19 Dec 2019 at 06:18, Tero Kristo <t-kristo@ti.com> wrote:
>
> On 18/12/2019 02:38, Mathieu Poirier wrote:
> > On Fri, Dec 13, 2019 at 02:55:27PM +0200, Tero Kristo wrote:
> >> From: Suman Anna <s-anna@ti.com>
> >>
> >> An implementation for the rproc ops .da_to_va() has been added
> >> that provides the address translation between device addresses
> >> to kernel virtual addresses for internal RAMs present on that
> >> particular remote processor device. The implementation provides
> >> the translations based on the addresses parsed and stored during
> >> the probe.
> >>
> >> This ops gets invoked by the exported rproc_da_to_va() function
> >> and allows the remoteproc core's ELF loader to be able to load
> >> program data directly into the internal memories.
> >>
> >> Signed-off-by: Suman Anna <s-anna@ti.com>
> >> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> >> ---
> >>   drivers/remoteproc/omap_remoteproc.c | 39 ++++++++++++++++++++++++++++
> >>   1 file changed, 39 insertions(+)
> >>
> >> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> >> index 844703507a74..28f14e24b389 100644
> >> --- a/drivers/remoteproc/omap_remoteproc.c
> >> +++ b/drivers/remoteproc/omap_remoteproc.c
> >> @@ -232,10 +232,49 @@ static int omap_rproc_stop(struct rproc *rproc)
> >>      return 0;
> >>   }
> >>
> >> +/**
> >> + * omap_rproc_da_to_va() - internal memory translation helper
> >> + * @rproc: remote processor to apply the address translation for
> >> + * @da: device address to translate
> >> + * @len: length of the memory buffer
> >> + *
> >> + * Custom function implementing the rproc .da_to_va ops to provide address
> >> + * translation (device address to kernel virtual address) for internal RAMs
> >> + * present in a DSP or IPU device). The translated addresses can be used
> >> + * either by the remoteproc core for loading, or by any rpmsg bus drivers.
> >> + * Returns the translated virtual address in kernel memory space, or NULL
> >> + * in failure.
> >> + */
> >> +static void *omap_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
> >> +{
> >> +    struct omap_rproc *oproc = rproc->priv;
> >> +    int i;
> >> +    u32 offset;
> >> +
> >> +    if (len <= 0)
> >> +            return NULL;
> >> +
> >> +    if (!oproc->num_mems)
> >> +            return NULL;
> >> +
> >> +    for (i = 0; i < oproc->num_mems; i++) {
> >> +            if (da >= oproc->mem[i].dev_addr && da + len <=
> >
> > Shouldn't this be '<' rather than '<=' ?
>
> No, I think <= is correct. You need to consider the initial byte in the
> range also. Consider a simple case where you provide the exact da + len
> corresponding to a specific memory range.

For that specific case you are correct.  On the flip side if @da falls
somewhere after @mem[i].dev_addr, there is a possibility to clobber
the first byte of the next range if <= is used.

Thanks,
Mathieu

>
> >
> >> +                oproc->mem[i].dev_addr +  oproc->mem[i].size) {
> >
> > One space too many after the '+' .
>
> True, I wonder why checkpatch did not catch this.
>
> >
> >> +                    offset = da -  oproc->mem[i].dev_addr;
> >
> > One space too many after then '-' .
>
> Same, will fix these two.
>
> -Tero
>
> >
> >> +                    /* __force to make sparse happy with type conversion */
> >> +                    return (__force void *)(oproc->mem[i].cpu_addr +
> >> +                                            offset);
> >> +            }
> >> +    }
> >> +
> >> +    return NULL;
> >> +}
> >> +
> >>   static const struct rproc_ops omap_rproc_ops = {
> >>      .start          = omap_rproc_start,
> >>      .stop           = omap_rproc_stop,
> >>      .kick           = omap_rproc_kick,
> >> +    .da_to_va       = omap_rproc_da_to_va,
> >>   };
> >>
> >>   static const char * const ipu_mem_names[] = {
> >> --
> >> 2.17.1
> >>
> >> --
>
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
