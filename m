Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B03819CFB0
	for <lists+linux-remoteproc@lfdr.de>; Fri,  3 Apr 2020 07:16:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728856AbgDCFQQ (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 3 Apr 2020 01:16:16 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:42949 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726024AbgDCFQQ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 3 Apr 2020 01:16:16 -0400
Received: by mail-pl1-f195.google.com with SMTP id e1so2255506plt.9
        for <linux-remoteproc@vger.kernel.org>; Thu, 02 Apr 2020 22:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gFAB+43FxugF6mGRABTZlwZq4uHrL3H7KI11kCNsEeY=;
        b=jJXD1BRqz6Kbn091BHOVQedEUveFyGy+oCi3/Qj1MtjDikt7eOKi4Grp6z5kpzEYyu
         9CMKQUThZFpP2x97gFyKbUrxmtM/AGMTVnW/sP4m2XWBosFrDNm5gcnzmEBlx7aPok7n
         3PuLX06VZM9z3a9gfK1lHGX+hj5qbPzlccMeMAoGMW+2x2gUGzB7Mi9ACBG8iwuBSxD9
         IHD4pei3VnJpsJHDIs4mUSnegHlhicyFnip93XoSHXp/a+ILTVho4mGnCC8v+xCGkylL
         YlRQppD7bzAT7KOefImz9gKxtZBNk3yz9LRJ4rfUdzINv6FXLLP6XKcAz89T9GmOsbFY
         w1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gFAB+43FxugF6mGRABTZlwZq4uHrL3H7KI11kCNsEeY=;
        b=ZqJ9xhU1yOOx6D2WfUYTLZmW8bF6k5C3y7g07UABpJhBm+cat0uqqxYFzLwGo6K/vH
         CwAP3pRMTmZIaPINTYzQAxynwch0GNheMKhB9cfxXHKAG44A1LS1EjKmHQHcuMZI2Gj/
         8Q2q6qLS/8huDYeB+M5ufD1PDk8yKxf6rLIs4VCmgcp9BYG7CGMGBXknqUjoUu+FzkwW
         FTvJ7pEjV/eb7xu7/hz/qkM+L6ZjHPvptxmVdUlZRpy7AIzF2tVBts4RAGaOuIpg92tY
         7g8e6qKV00+ip2KVuMIlqROk+SKy/mS20hOiF54n2ics6Haykv0yYFnb7CzNG7f+xGGT
         NoOw==
X-Gm-Message-State: AGi0Pua1xtvkr5tjcUQZwrNBKuSzxPjLY0J9TGqVSQ1Kp+ol2tx4rc5w
        +3grFG/gAYiL3iWrq+NbvZMo0w==
X-Google-Smtp-Source: APiQypIdUXp9qL1JIRm9kyqJs9P20HXi/B6cJ1P6TjpxRWfwuePsLw4oqJEq8o/GYue1yJPUd7estA==
X-Received: by 2002:a17:90b:8c:: with SMTP id bb12mr7444857pjb.59.1585890974770;
        Thu, 02 Apr 2020 22:16:14 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id l18sm4473883pgc.26.2020.04.02.22.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2020 22:16:14 -0700 (PDT)
Date:   Thu, 2 Apr 2020 22:16:11 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        ohad@wizery.com, psodagud@codeaurora.org, tsoni@codeaurora.org,
        sidgup@codeaurora.org
Subject: Re: [PATCH] remoteproc: core: Add a memory efficient coredump
 function
Message-ID: <20200403051611.GJ663905@yoga>
References: <1585353412-19644-1-git-send-email-rishabhb@codeaurora.org>
 <20200401195114.GD267644@minitux>
 <20200402172435.GA2785@xps15>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200402172435.GA2785@xps15>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu 02 Apr 10:24 PDT 2020, Mathieu Poirier wrote:

> On Wed, Apr 01, 2020 at 12:51:14PM -0700, Bjorn Andersson wrote:
> > On Fri 27 Mar 16:56 PDT 2020, Rishabh Bhatnagar wrote:
> > 
> > > The current coredump implementation uses vmalloc area to copy
> > > all the segments. But this might put a lot of strain on low memory
> > > targets as the firmware size sometimes is in ten's of MBs.
> > > The situation becomes worse if there are multiple remote processors
> > > undergoing recovery at the same time.
> > > This patch directly copies the device memory to userspace buffer
> > > and avoids extra memory usage. This requires recovery to be halted
> > > until data is read by userspace and free function is called.
> > > 
> > > Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> > > ---
> > >  drivers/remoteproc/remoteproc_core.c | 107 +++++++++++++++++++++++++++++------
> > >  include/linux/remoteproc.h           |   4 ++
> > >  2 files changed, 94 insertions(+), 17 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > > index 097f33e..2d881e5 100644
> > > --- a/drivers/remoteproc/remoteproc_core.c
> > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > @@ -1516,6 +1516,86 @@ int rproc_coredump_add_segment(struct rproc *rproc, dma_addr_t da, size_t size)
> > >  }
> > >  EXPORT_SYMBOL(rproc_coredump_add_segment);
> > >  
> > > +
> > > +void rproc_free_dump(void *data)
> > 
> > static
> > 
> > > +{
> > > +	struct rproc *rproc = data;
> > > +
> > > +	dev_info(&rproc->dev, "Userspace done reading rproc dump\n");
> > 
> > Please drop the info prints throughout.
> > 
> > > +	complete(&rproc->dump_done);
> > > +}
> > > +
> > > +static unsigned long get_offset(loff_t user_offset, struct list_head *segments,
> > > +				unsigned long *data_left)
> > 
> > Please rename this rproc_coredump_resolve_segment(), or something along
> > those lines.
> > 
> > > +{
> > > +	struct rproc_dump_segment *segment;
> > > +
> > > +	list_for_each_entry(segment, segments, node) {
> > > +		if (user_offset >= segment->size)
> > > +			user_offset -= segment->size;
> > > +		else
> > > +			break;
> > > +	}
> > > +
> > > +	if (&segment->node == segments) {
> > > +		*data_left = 0;
> > > +		return 0;
> > > +	}
> > > +
> > > +	*data_left = segment->size - user_offset;
> > > +
> > > +	return segment->da + user_offset;
> > > +}
> > > +
> > > +static ssize_t rproc_read_dump(char *buffer, loff_t offset, size_t count,
> > > +				void *data, size_t elfcorelen)
> > > +{
> > > +	void *device_mem = NULL;
> > > +	unsigned long data_left = 0;
> > > +	unsigned long bytes_left = count;
> > > +	unsigned long addr = 0;
> > > +	size_t copy_size = 0;
> > > +	struct rproc *rproc = data;
> > > +
> > > +	if (offset < elfcorelen) {
> > > +		copy_size = elfcorelen - offset;
> > > +		copy_size = min(copy_size, bytes_left);
> > > +
> > > +		memcpy(buffer, rproc->elfcore + offset, copy_size);
> > > +		offset += copy_size;
> > > +		bytes_left -= copy_size;
> > > +		buffer += copy_size;
> > > +	}
> > > +
> > > +	while (bytes_left) {
> > > +		addr = get_offset(offset - elfcorelen, &rproc->dump_segments,
> > > +				&data_left);
> > > +	/* EOF check */
> > 
> > Indentation, and "if no data left" does indicate that this is the end of
> > the loop already.
> > 
> > > +		if (data_left == 0) {
> > > +			pr_info("Ramdump complete. %lld bytes read.", offset);
> > > +			return 0;
> > 
> > You might have copied data to the buffer, so returning 0 here doesn't
> > seem right. Presumably instead you should break and return offset -
> > original offset or something like that.
> > 
> > > +		}
> > > +
> > > +		copy_size = min_t(size_t, bytes_left, data_left);
> > > +
> > > +		device_mem = rproc->ops->da_to_va(rproc, addr, copy_size);
> > > +		if (!device_mem) {
> > > +			pr_err("Unable to ioremap: addr %lx, size %zd\n",
> > > +				 addr, copy_size);
> > > +			return -ENOMEM;
> > > +		}
> > > +		memcpy(buffer, device_mem, copy_size);
> > > +
> > > +		offset += copy_size;
> > > +		buffer += copy_size;
> > > +		bytes_left -= copy_size;
> > > +		dev_dbg(&rproc->dev, "Copied %d bytes to userspace\n",
> > > +			copy_size);
> > > +	}
> > > +
> > > +	return count;
> > 
> > This should be the number of bytes actually returned, so if count is
> > larger than the sum of the segment sizes this will be wrong.
> > 
> > > +}
> > > +
> > >  /**
> > >   * rproc_coredump_add_custom_segment() - add custom coredump segment
> > >   * @rproc:	handle of a remote processor
> > > @@ -1566,27 +1646,27 @@ static void rproc_coredump(struct rproc *rproc)
> > >  	struct rproc_dump_segment *segment;
> > >  	struct elf32_phdr *phdr;
> > >  	struct elf32_hdr *ehdr;
> > > -	size_t data_size;
> > > +	size_t header_size;
> > >  	size_t offset;
> > >  	void *data;
> > > -	void *ptr;
> > >  	int phnum = 0;
> > >  
> > >  	if (list_empty(&rproc->dump_segments))
> > >  		return;
> > >  
> > > -	data_size = sizeof(*ehdr);
> > > +	header_size = sizeof(*ehdr);
> > >  	list_for_each_entry(segment, &rproc->dump_segments, node) {
> > > -		data_size += sizeof(*phdr) + segment->size;
> > > +		header_size += sizeof(*phdr);
> > >  
> > >  		phnum++;
> > >  	}
> > >  
> > > -	data = vmalloc(data_size);
> > > +	data = vmalloc(header_size);
> > >  	if (!data)
> > >  		return;
> > >  
> > >  	ehdr = data;
> > > +	rproc->elfcore = data;
> > 
> > Rather than using a rproc-global variable I would prefer that you create
> > a new rproc_coredump_state struct that carries the header pointer and
> > the information needed by the read & free functions.
> > 
> > >  
> > >  	memset(ehdr, 0, sizeof(*ehdr));
> > >  	memcpy(ehdr->e_ident, ELFMAG, SELFMAG);
> > > @@ -1618,23 +1698,14 @@ static void rproc_coredump(struct rproc *rproc)
> > >  
> > >  		if (segment->dump) {
> > >  			segment->dump(rproc, segment, data + offset);
> 
> I'm not exactly sure why custom segments can be copied to the elf image but not
> generic ones... And as far as I can tell accessing "data + offset" will blow up
> because only the memory for the program headers has been allocated, not for the
> program segments. 
> 

Thanks, I missed that, but you're correct.

> 
> > > -		} else {
> > > -			ptr = rproc_da_to_va(rproc, segment->da, segment->size);
> > > -			if (!ptr) {
> > > -				dev_err(&rproc->dev,
> > > -					"invalid coredump segment (%pad, %zu)\n",
> > > -					&segment->da, segment->size);
> > > -				memset(data + offset, 0xff, segment->size);
> > > -			} else {
> > > -				memcpy(data + offset, ptr, segment->size);
> > > -			}
> > > -		}
> > >  
> > >  		offset += phdr->p_filesz;
> > >  		phdr++;
> > >  	}
> > > +	dev_coredumpm(&rproc->dev, NULL, rproc, header_size, GFP_KERNEL,
> > > +			rproc_read_dump, rproc_free_dump);
> > >  
> > > -	dev_coredumpv(&rproc->dev, data, data_size, GFP_KERNEL);
> > > +	wait_for_completion(&rproc->dump_done);
> > 
> > This will mean that recovery handling will break on installations that
> > doesn't have your ramdump collector - as it will just sit here forever
> > (5 minutes) waiting for userspace to do its job.
> 
> Right, that problem also came to mind.
> 
> > 
> > I think we need to device a new sysfs attribute, through which you can
> > enable the "inline" coredump mechanism. That way recovery would work for
> > all systems and in your specific case you could reconfigure it - perhaps
> > once the ramdump collector starts.
> 
> Another option is to make rproc_coredump() customizable, as with all the other
> functions in remoteproc_internal.h.  That way the current rproc_coredump() is
> kept intact and we don't need a new sysfs entry.
> 

Rishabh suggested this in a discussion we had earlier this week as well,
but we still have the problem that the same platform driver will need to
support both modes, depending on which user space is running. So even if
we push this out to the platform driver we still need some mechanism
for userspace to enable the "inline" mode.

Regards,
Bjorn
