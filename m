Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F75A19DE32
	for <lists+linux-remoteproc@lfdr.de>; Fri,  3 Apr 2020 20:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728276AbgDCSqS (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 3 Apr 2020 14:46:18 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:47491 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726087AbgDCSqR (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 3 Apr 2020 14:46:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585939576; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=MhwRegvxQrRF9p/QfSaqN1ehQ0wiTG2eaDJJpc5A9ec=;
 b=aHvj/RccZUPL8goWt9tQuJSi6/n5OupenAkYozcw2IFeyU5N6R8IrC4RNrbql1toB7ydoyLT
 2C+RShiz4/TY7ZiYeM3mpwYh+7GqfsTjf3+dJNKDBhJ2CkyPbFqvHx5Vnk4M6Anbwa/CxGhZ
 Cw7E4k3XC7QMu9L/N77eDiNSCW8=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e87846b.7f1e0de65ca8-smtp-out-n03;
 Fri, 03 Apr 2020 18:46:03 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3A975C4478C; Fri,  3 Apr 2020 18:46:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 133A8C433BA;
        Fri,  3 Apr 2020 18:46:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 03 Apr 2020 11:46:01 -0700
From:   rishabhb@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        ohad@wizery.com, psodagud@codeaurora.org, tsoni@codeaurora.org,
        sidgup@codeaurora.org
Subject: Re: [PATCH] remoteproc: core: Add a memory efficient coredump
 function
In-Reply-To: <20200403051611.GJ663905@yoga>
References: <1585353412-19644-1-git-send-email-rishabhb@codeaurora.org>
 <20200401195114.GD267644@minitux> <20200402172435.GA2785@xps15>
 <20200403051611.GJ663905@yoga>
Message-ID: <1388d1c2ef5f573e723ea2f43a64496b@codeaurora.org>
X-Sender: rishabhb@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 2020-04-02 22:16, Bjorn Andersson wrote:
> On Thu 02 Apr 10:24 PDT 2020, Mathieu Poirier wrote:
> 
>> On Wed, Apr 01, 2020 at 12:51:14PM -0700, Bjorn Andersson wrote:
>> > On Fri 27 Mar 16:56 PDT 2020, Rishabh Bhatnagar wrote:
>> >
>> > > The current coredump implementation uses vmalloc area to copy
>> > > all the segments. But this might put a lot of strain on low memory
>> > > targets as the firmware size sometimes is in ten's of MBs.
>> > > The situation becomes worse if there are multiple remote processors
>> > > undergoing recovery at the same time.
>> > > This patch directly copies the device memory to userspace buffer
>> > > and avoids extra memory usage. This requires recovery to be halted
>> > > until data is read by userspace and free function is called.
>> > >
>> > > Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
>> > > ---
>> > >  drivers/remoteproc/remoteproc_core.c | 107 +++++++++++++++++++++++++++++------
>> > >  include/linux/remoteproc.h           |   4 ++
>> > >  2 files changed, 94 insertions(+), 17 deletions(-)
>> > >
>> > > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> > > index 097f33e..2d881e5 100644
>> > > --- a/drivers/remoteproc/remoteproc_core.c
>> > > +++ b/drivers/remoteproc/remoteproc_core.c
>> > > @@ -1516,6 +1516,86 @@ int rproc_coredump_add_segment(struct rproc *rproc, dma_addr_t da, size_t size)
>> > >  }
>> > >  EXPORT_SYMBOL(rproc_coredump_add_segment);
>> > >
>> > > +
>> > > +void rproc_free_dump(void *data)
>> >
>> > static
>> >
>> > > +{
>> > > +	struct rproc *rproc = data;
>> > > +
>> > > +	dev_info(&rproc->dev, "Userspace done reading rproc dump\n");
>> >
>> > Please drop the info prints throughout.
>> >
>> > > +	complete(&rproc->dump_done);
>> > > +}
>> > > +
>> > > +static unsigned long get_offset(loff_t user_offset, struct list_head *segments,
>> > > +				unsigned long *data_left)
>> >
>> > Please rename this rproc_coredump_resolve_segment(), or something along
>> > those lines.
>> >
>> > > +{
>> > > +	struct rproc_dump_segment *segment;
>> > > +
>> > > +	list_for_each_entry(segment, segments, node) {
>> > > +		if (user_offset >= segment->size)
>> > > +			user_offset -= segment->size;
>> > > +		else
>> > > +			break;
>> > > +	}
>> > > +
>> > > +	if (&segment->node == segments) {
>> > > +		*data_left = 0;
>> > > +		return 0;
>> > > +	}
>> > > +
>> > > +	*data_left = segment->size - user_offset;
>> > > +
>> > > +	return segment->da + user_offset;
>> > > +}
>> > > +
>> > > +static ssize_t rproc_read_dump(char *buffer, loff_t offset, size_t count,
>> > > +				void *data, size_t elfcorelen)
>> > > +{
>> > > +	void *device_mem = NULL;
>> > > +	unsigned long data_left = 0;
>> > > +	unsigned long bytes_left = count;
>> > > +	unsigned long addr = 0;
>> > > +	size_t copy_size = 0;
>> > > +	struct rproc *rproc = data;
>> > > +
>> > > +	if (offset < elfcorelen) {
>> > > +		copy_size = elfcorelen - offset;
>> > > +		copy_size = min(copy_size, bytes_left);
>> > > +
>> > > +		memcpy(buffer, rproc->elfcore + offset, copy_size);
>> > > +		offset += copy_size;
>> > > +		bytes_left -= copy_size;
>> > > +		buffer += copy_size;
>> > > +	}
>> > > +
>> > > +	while (bytes_left) {
>> > > +		addr = get_offset(offset - elfcorelen, &rproc->dump_segments,
>> > > +				&data_left);
>> > > +	/* EOF check */
>> >
>> > Indentation, and "if no data left" does indicate that this is the end of
>> > the loop already.
>> >
>> > > +		if (data_left == 0) {
>> > > +			pr_info("Ramdump complete. %lld bytes read.", offset);
>> > > +			return 0;
>> >
>> > You might have copied data to the buffer, so returning 0 here doesn't
>> > seem right. Presumably instead you should break and return offset -
>> > original offset or something like that.
>> >
>> > > +		}
>> > > +
>> > > +		copy_size = min_t(size_t, bytes_left, data_left);
>> > > +
>> > > +		device_mem = rproc->ops->da_to_va(rproc, addr, copy_size);
>> > > +		if (!device_mem) {
>> > > +			pr_err("Unable to ioremap: addr %lx, size %zd\n",
>> > > +				 addr, copy_size);
>> > > +			return -ENOMEM;
>> > > +		}
>> > > +		memcpy(buffer, device_mem, copy_size);
>> > > +
>> > > +		offset += copy_size;
>> > > +		buffer += copy_size;
>> > > +		bytes_left -= copy_size;
>> > > +		dev_dbg(&rproc->dev, "Copied %d bytes to userspace\n",
>> > > +			copy_size);
>> > > +	}
>> > > +
>> > > +	return count;
>> >
>> > This should be the number of bytes actually returned, so if count is
>> > larger than the sum of the segment sizes this will be wrong.
>> >
>> > > +}
>> > > +
>> > >  /**
>> > >   * rproc_coredump_add_custom_segment() - add custom coredump segment
>> > >   * @rproc:	handle of a remote processor
>> > > @@ -1566,27 +1646,27 @@ static void rproc_coredump(struct rproc *rproc)
>> > >  	struct rproc_dump_segment *segment;
>> > >  	struct elf32_phdr *phdr;
>> > >  	struct elf32_hdr *ehdr;
>> > > -	size_t data_size;
>> > > +	size_t header_size;
>> > >  	size_t offset;
>> > >  	void *data;
>> > > -	void *ptr;
>> > >  	int phnum = 0;
>> > >
>> > >  	if (list_empty(&rproc->dump_segments))
>> > >  		return;
>> > >
>> > > -	data_size = sizeof(*ehdr);
>> > > +	header_size = sizeof(*ehdr);
>> > >  	list_for_each_entry(segment, &rproc->dump_segments, node) {
>> > > -		data_size += sizeof(*phdr) + segment->size;
>> > > +		header_size += sizeof(*phdr);
>> > >
>> > >  		phnum++;
>> > >  	}
>> > >
>> > > -	data = vmalloc(data_size);
>> > > +	data = vmalloc(header_size);
>> > >  	if (!data)
>> > >  		return;
>> > >
>> > >  	ehdr = data;
>> > > +	rproc->elfcore = data;
>> >
>> > Rather than using a rproc-global variable I would prefer that you create
>> > a new rproc_coredump_state struct that carries the header pointer and
>> > the information needed by the read & free functions.
>> >
>> > >
>> > >  	memset(ehdr, 0, sizeof(*ehdr));
>> > >  	memcpy(ehdr->e_ident, ELFMAG, SELFMAG);
>> > > @@ -1618,23 +1698,14 @@ static void rproc_coredump(struct rproc *rproc)
>> > >
>> > >  		if (segment->dump) {
>> > >  			segment->dump(rproc, segment, data + offset);
>> 
>> I'm not exactly sure why custom segments can be copied to the elf 
>> image but not
>> generic ones... And as far as I can tell accessing "data + offset" 
>> will blow up
>> because only the memory for the program headers has been allocated, 
>> not for the
>> program segments.
>> 
> 
> Thanks, I missed that, but you're correct.
> 
>> 
>> > > -		} else {
>> > > -			ptr = rproc_da_to_va(rproc, segment->da, segment->size);
>> > > -			if (!ptr) {
>> > > -				dev_err(&rproc->dev,
>> > > -					"invalid coredump segment (%pad, %zu)\n",
>> > > -					&segment->da, segment->size);
>> > > -				memset(data + offset, 0xff, segment->size);
>> > > -			} else {
>> > > -				memcpy(data + offset, ptr, segment->size);
>> > > -			}
>> > > -		}
>> > >
>> > >  		offset += phdr->p_filesz;
>> > >  		phdr++;
>> > >  	}
>> > > +	dev_coredumpm(&rproc->dev, NULL, rproc, header_size, GFP_KERNEL,
>> > > +			rproc_read_dump, rproc_free_dump);
>> > >
>> > > -	dev_coredumpv(&rproc->dev, data, data_size, GFP_KERNEL);
>> > > +	wait_for_completion(&rproc->dump_done);
>> >
>> > This will mean that recovery handling will break on installations that
>> > doesn't have your ramdump collector - as it will just sit here forever
>> > (5 minutes) waiting for userspace to do its job.
>> 
>> Right, that problem also came to mind.
>> 
>> >
>> > I think we need to device a new sysfs attribute, through which you can
>> > enable the "inline" coredump mechanism. That way recovery would work for
>> > all systems and in your specific case you could reconfigure it - perhaps
>> > once the ramdump collector starts.
>> 
>> Another option is to make rproc_coredump() customizable, as with all 
>> the other
>> functions in remoteproc_internal.h.  That way the current 
>> rproc_coredump() is
>> kept intact and we don't need a new sysfs entry.
>> 
> 
> Rishabh suggested this in a discussion we had earlier this week as 
> well,
> but we still have the problem that the same platform driver will need 
> to
> support both modes, depending on which user space is running. So even 
> if
> we push this out to the platform driver we still need some mechanism
> for userspace to enable the "inline" mode.
> 
> Regards,
> Bjorn
I think doing both makes sense. Making it customizable will keep the 
original
function intact and enable platform driver to implement their own 
functionality. It
will default to rproc_coredump. Also adding a sysfs entry that would 
skip the
wait_for_completion if not set so that it doesn't block recovery.
