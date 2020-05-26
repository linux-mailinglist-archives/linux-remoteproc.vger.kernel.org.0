Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76B5A1CE9AE
	for <lists+linux-remoteproc@lfdr.de>; Tue, 12 May 2020 02:32:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728073AbgELAcG (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 11 May 2020 20:32:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725881AbgELAcE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 11 May 2020 20:32:04 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8656BC061A0C
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 May 2020 17:32:03 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id y25so5523446pfn.5
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 May 2020 17:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cahxjkNnR7vy94cxlv/WK/sRNgi2Box6MUyunAHVGu0=;
        b=MB5hM1WSl64U49oa2O/eS5qYDXZ17ch4NPdlleVUTilvD1ol61Rwq/xsT6XAAiXSVP
         IHXVLyP+sadDsdJfy1XQC02n9BTTZoyp7Z3D9BqgKcO+fYPTOraWSUWc03mCllXEwqkB
         uA49A9Sc4rM4//UB1l1S8P2jKDt19fPUy2PfE+HBrok45ndQ67piwgj6+zTnEuU6U039
         3WHhR1Fx7StIUEZHbW4+FaUNOixvMut7/PJlwlbMqQwBW6VS+8QMv/bckdVR6uvKARDI
         60cuM61V6/l8dg9bj0vS0mvAmAV7SkEP4OasTyD5GIQUkgyaPqgmiVm3vjfs4Vmx8136
         fZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cahxjkNnR7vy94cxlv/WK/sRNgi2Box6MUyunAHVGu0=;
        b=N1/m2Nhkgx8C8upuXlygSt0SofLmpIyRfvQ9pe4tFUcrsM8VdI6+dRCFR68DNd/7e5
         fLNZY2Hqd+gqUBqkvtG4QWD6w3RtjSVyaohEW5/adrIxeFmrqs/kBwNWnz82P3RrWvKB
         f+kffEsvf9Xrr96aEtuV5TGK+bmmVETdbs4rGSlsw+LkdFcz0VyDeDuSJ1NJD7KPRKpR
         zAltjLDB/P//Ad8HD96rLc4YTKsUj26hS2S4I+sf9YCdyRodWbtI6xhqt7X19wqa68h2
         /kvlSzus8zxqW2zNbOI9PvWw8aBucn94KeMAr4i4q3foPqzSMz4nPgNIwbKLWG9+QTR/
         PESw==
X-Gm-Message-State: AGi0PuZNXGL4X5Tyf2dBPl3yczFn9/vLRKcD4Xd+11cVw2LlX2Bl2MUN
        1qk915NCxFIJa42THDv/LizQOQ==
X-Google-Smtp-Source: APiQypKPvbMuKRa2vNpXIz2qR+QsxHPuJkRCqtfESPFD+H+2oWg6JHqyAbdhajIxoq+n3SkJAfYnpg==
X-Received: by 2002:a63:a012:: with SMTP id r18mr16646070pge.352.1589243522794;
        Mon, 11 May 2020 17:32:02 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id s44sm11461456pjc.28.2020.05.11.17.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 17:32:02 -0700 (PDT)
Date:   Mon, 11 May 2020 17:30:28 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     rishabhb@codeaurora.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        ohad@wizery.com, mathieu.poirier@linaro.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, sidgup@codeaurora.org,
        linux-remoteproc-owner@vger.kernel.org
Subject: Re: [PATCH 2/3] remoteproc: Add inline coredump functionality
Message-ID: <20200512003028.GA2165@builder.lan>
References: <1587062312-4939-1-git-send-email-rishabhb@codeaurora.org>
 <1587062312-4939-2-git-send-email-rishabhb@codeaurora.org>
 <20200507202121.GK2329931@builder.lan>
 <7deb97ab40dd36d5a51111147cf4c14e@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7deb97ab40dd36d5a51111147cf4c14e@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 11 May 17:11 PDT 2020, rishabhb@codeaurora.org wrote:

> On 2020-05-07 13:21, Bjorn Andersson wrote:
> > On Thu 16 Apr 11:38 PDT 2020, Rishabh Bhatnagar wrote:
> > 
> > > This patch adds the inline coredump functionality. The current
> > > coredump implementation uses vmalloc area to copy all the segments.
> > > But this might put a lot of strain on low memory targets as the
> > > firmware size sometimes is in ten's of MBs. The situation becomes
> > > worse if there are multiple remote processors  undergoing recovery
> > > at the same time. This patch directly copies the device memory to
> > > userspace buffer and avoids extra memory usage. This requires
> > > recovery to be halted until data is read by userspace and free
> > > function is called.
> > > 
> > > Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> > > ---
> > >  drivers/remoteproc/remoteproc_coredump.c | 130
> > > +++++++++++++++++++++++++++++++
> > >  drivers/remoteproc/remoteproc_internal.h |  23 +++++-
> > >  include/linux/remoteproc.h               |   2 +
> > >  3 files changed, 153 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/remoteproc_coredump.c
> > > b/drivers/remoteproc/remoteproc_coredump.c
> > > index 9de0467..888b7dec91 100644
> > > --- a/drivers/remoteproc/remoteproc_coredump.c
> > > +++ b/drivers/remoteproc/remoteproc_coredump.c
> > > @@ -12,6 +12,84 @@
> > >  #include <linux/remoteproc.h>
> > >  #include "remoteproc_internal.h"
> > > 
> > > +static void rproc_free_dump(void *data)
> > 
> > rproc_coredump_free()
> > 
> > > +{
> > > +	struct rproc_coredump_state *dump_state = data;
> > > +
> > > +	complete(&dump_state->dump_done);
> > 
> > vfree(dump_state->header);
> > 
> > > +}
> > > +
> > > +static unsigned long resolve_addr(loff_t user_offset,
> > 
> > rproc_coredump_find_segment()
> > 
> > > +				   struct list_head *segments,
> > > +				   unsigned long *data_left)
> > > +{
> > > +	struct rproc_dump_segment *segment;
> > > +
> > > +	list_for_each_entry(segment, segments, node) {
> > > +		if (user_offset >= segment->size)
> > > +			user_offset -= segment->size;
> > > +		else
> > > +			break;
> > 
> > 		if (user_offset < segment->size) {
> > 			*data_left = segment->size - user_offset;
> > 			return segment->da + user_offset;
> > 		}
> > 
> > 		user_offset -= segment->size;
> > > +	}
> > 
> > 	*data_left = 0;
> > 	return 0;
> > 
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
> > > +static ssize_t rproc_read_dump(char *buffer, loff_t offset, size_t
> > > count,
> > > +				void *data, size_t header_size)
> > > +{
> > > +	void *device_mem;
> > > +	size_t data_left, copy_size, bytes_left = count;
> > > +	unsigned long addr;
> > > +	struct rproc_coredump_state *dump_state = data;
> > > +	struct rproc *rproc = dump_state->rproc;
> > > +	void *elfcore = dump_state->header;
> > > +
> > > +	/* Copy the header first */
> > > +	if (offset < header_size) {
> > > +		copy_size = header_size - offset;
> > > +		copy_size = min(copy_size, bytes_left);
> > > +
> > > +		memcpy(buffer, elfcore + offset, copy_size);
> > > +		offset += copy_size;
> > > +		bytes_left -= copy_size;
> > > +		buffer += copy_size;
> > > +	}
> > 
> > Perhaps you can take inspiration from devcd_readv() here?
> > 
> > > +
> > > +	while (bytes_left) {
> > > +		addr = resolve_addr(offset - header_size,
> > > +				    &rproc->dump_segments, &data_left);
> > > +		/* EOF check */
> > > +		if (data_left == 0) {
> > 
> > Afaict data_left denotes the amount of data left in this particular
> > segment, rather than in the entire core.
> > 
> Yes, but it only returns 0 when the final segment has been copied
> completely.  Otherwise it gives data left to copy for every segment
> and moves to next segment once the current one is copied.

You're right.

> > I think you should start by making bytes_left the minimum of the core
> > size and @count and then have this loop as long as bytes_left, copying
> > data to the buffer either from header or an appropriate segment based on
> > the current offset.
> > 
> That would require an extra function that calculates entire core size,
> as its not available right now. Do you see any missed corner cases with this
> approach?

You're looping over all the segments as you're building the header
anyways, so you could simply store this in the dump_state. I think this
depend more on the ability to reuse the read function between inline and
default coredump.

Regards,
Bjorn

> > > +			pr_info("Ramdump complete %lld bytes read", offset);
> > 
> > dev_dbg(&rproc->dev, ...)
> > 
> > > +			break;
> > > +		}
> > > +
> > > +		copy_size = min_t(size_t, bytes_left, data_left);
> > > +
> > > +		device_mem = rproc->ops->da_to_va(rproc, addr, copy_size);
> > 
> > rproc_da_to_va()
> > 
> > > +		if (!device_mem) {
> > > +			pr_err("Address:%lx with size %zd out of remoteproc carveout\n",
> > 
> > dev_err(&rproc->dev, "coredump: %#lx size %#zx outside of carveouts\n",
> > ..);
> > 
> > > +				addr, copy_size);
> > > +			return -ENOMEM;
> > > +		}
> > > +		memcpy(buffer, device_mem, copy_size);
> > > +
> > > +		offset += copy_size;
> > > +		buffer += copy_size;
> > > +		bytes_left -= copy_size;
> > > +	}
> > > +
> > > +	return count - bytes_left;
> > > +}
> > > +
> > >  static void create_elf_header(void *data, int phnum, struct rproc
> > > *rproc)
> > >  {
> > >  	struct elf32_phdr *phdr;
> > > @@ -55,6 +133,58 @@ static void create_elf_header(void *data, int
> > > phnum, struct rproc *rproc)
> > >  }
> > > 
> > >  /**
> > > + * rproc_inline_coredump() - perform synchronized coredump
> > > + * @rproc:	rproc handle
> > > + *
> > > + * This function will generate an ELF header for the registered
> > > segments
> > > + * and create a devcoredump device associated with rproc. This
> > > function
> > > + * directly copies the segments from device memory to userspace. The
> > > + * recovery is stalled until the enitire coredump is read. This
> > > approach
> > > + * avoids using extra vmalloc memory(which can be really large).
> > > + */
> > > +void rproc_inline_coredump(struct rproc *rproc)
> > > +{
> > > +	struct rproc_dump_segment *segment;
> > > +	struct elf32_phdr *phdr;
> > > +	struct elf32_hdr *ehdr;
> > > +	struct rproc_coredump_state *dump_state;
> > 
> > This can live on the stack, unless you follow my suggestion below...
> > 
> > > +	size_t header_size;
> > > +	void *data;
> > > +	int phnum = 0;
> > > +
> > > +	if (list_empty(&rproc->dump_segments))
> > > +		return;
> > > +
> > > +	header_size = sizeof(*ehdr);
> > > +	list_for_each_entry(segment, &rproc->dump_segments, node) {
> > > +		header_size += sizeof(*phdr);
> > > +
> > > +		phnum++;
> > > +	}
> > > +
> > > +	data = vmalloc(header_size);
> > > +	if (!data)
> > > +		return;
> > > +
> > > +	ehdr = data;
> > 
> > ehdr is unused.
> > 
> > > +	create_elf_header(data, phnum, rproc);
> > > +
> > > +	dump_state = kzalloc(sizeof(*dump_state), GFP_KERNEL);
> > > +	dump_state->rproc = rproc;
> > > +	dump_state->header = data;
> > > +	init_completion(&dump_state->dump_done);
> > > +
> > > +	dev_coredumpm(&rproc->dev, NULL, dump_state, header_size,
> > > GFP_KERNEL,
> > > +		      rproc_read_dump, rproc_free_dump);
> > 
> > I can help feeling that if you vmalloc() either the header or the entire
> > thing depending on DEFAULT vs INLINE and populate it with either all
> > segments or just the header, then you should be able to use the same
> > (custom) read function to serve both cases.
> > 
> > You should by doing this be able to avoid some duplication, your two
> > code paths would not diverge and the main difference would be if you
> > wait or not below (the kfree would have to go in the rproc_free_dump).
> > 
> > > +
> > > +	/* Wait until the dump is read and free is called */
> > > +	wait_for_completion(&dump_state->dump_done);
> > > +
> > > +	kfree(dump_state);
> > > +}
> > > +EXPORT_SYMBOL(rproc_inline_coredump);
> > > +
> > > +/**
> > >   * rproc_default_coredump() - perform coredump
> > >   * @rproc:	rproc handle
> > >   *
> > > diff --git a/drivers/remoteproc/remoteproc_internal.h
> > > b/drivers/remoteproc/remoteproc_internal.h
> > > index 28b6af2..ea6146e 100644
> > > --- a/drivers/remoteproc/remoteproc_internal.h
> > > +++ b/drivers/remoteproc/remoteproc_internal.h
> > > @@ -24,6 +24,18 @@ struct rproc_debug_trace {
> > >  	struct rproc_mem_entry trace_mem;
> > >  };
> > > 
> > > +struct rproc_coredump_state {
> > 
> > This is only used within remoteproc_coredump.c, so please move it there.
> > 
> > > +	struct rproc *rproc;
> > > +	void *header;
> > > +	struct completion dump_done;
> > > +};
> > > +
> > > +enum rproc_coredump_conf {
> > 
> > How about rproc_coredump_mechanism?
> > 
> > > +	COREDUMP_DEFAULT,
> > > +	COREDUMP_INLINE,
> > > +	COREDUMP_DISABLED,
> > > +};
> > > +
> > >  /* from remoteproc_core.c */
> > >  void rproc_release(struct kref *kref);
> > >  irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id);
> > > @@ -49,6 +61,7 @@ struct dentry *rproc_create_trace_file(const char
> > > *name, struct rproc *rproc,
> > > 
> > >  /* from remoteproc_coredump.c */
> > >  void rproc_default_coredump(struct rproc *rproc);
> > > +void rproc_inline_coredump(struct rproc *rproc);
> > > 
> > >  void rproc_free_vring(struct rproc_vring *rvring);
> > >  int rproc_alloc_vring(struct rproc_vdev *rvdev, int i);
> > > @@ -125,8 +138,14 @@ struct resource_table
> > > *rproc_find_loaded_rsc_table(struct rproc *rproc,
> > >  static inline
> > >  void rproc_coredump(struct rproc *rproc)
> > >  {
> > > -	return rproc_default_coredump(rproc);
> > > -
> > > +	switch (rproc->coredump_conf) {
> > > +	case COREDUMP_DEFAULT:
> > > +		return rproc_default_coredump(rproc);
> > > +	case COREDUMP_INLINE:
> > > +		return rproc_inline_coredump(rproc);
> > > +	default:
> > > +		break;
> > > +	}
> > 
> > I think this better belong inside remoteproc_coredump.c
> > 
> > Regards,
> > Bjorn
> > 
> > >  }
> > > 
> > >  #endif /* REMOTEPROC_INTERNAL_H */
> > > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > > index 16ad666..23298ce 100644
> > > --- a/include/linux/remoteproc.h
> > > +++ b/include/linux/remoteproc.h
> > > @@ -459,6 +459,7 @@ struct rproc_dump_segment {
> > >   * @dev: virtual device for refcounting and common remoteproc
> > > behavior
> > >   * @power: refcount of users who need this rproc powered up
> > >   * @state: state of the device
> > > + * @coredump_conf: Currenlty selected coredump configuration
> > >   * @lock: lock which protects concurrent manipulations of the rproc
> > >   * @dbg_dir: debugfs directory of this rproc device
> > >   * @traces: list of trace buffers
> > > @@ -492,6 +493,7 @@ struct rproc {
> > >  	struct device dev;
> > >  	atomic_t power;
> > >  	unsigned int state;
> > > +	unsigned int coredump_conf;
> > >  	struct mutex lock;
> > >  	struct dentry *dbg_dir;
> > >  	struct list_head traces;
> > > --
> > > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
> > > Forum,
> > > a Linux Foundation Collaborative Project
