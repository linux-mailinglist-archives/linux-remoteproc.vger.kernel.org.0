Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 762B725D29F
	for <lists+linux-remoteproc@lfdr.de>; Fri,  4 Sep 2020 09:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbgIDHqq (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 4 Sep 2020 03:46:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbgIDHqp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 4 Sep 2020 03:46:45 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A584C061244;
        Fri,  4 Sep 2020 00:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=QKTSDK+FykCg0MN+vQ8ItyimOO6LKRGC0v2V63iruNc=; b=L1dBKlcRVnxtseJ2dUiZ+ZQz2k
        pr+phGt2j+BhWofRn2lhZZIZMvG91sNBOFg7akek5FkE/6AcJ5b7e98C7xeUgfzwyyC/Qc4LL/Sia
        KgtrwwKoY3S1uVmA5C9FdQgbXZkZ8fVybIRgmawyvFe77qb5+Dw2UxEOT1HvR4YzW+G3HDdBYeubw
        E3PWjgbrBhlA3mtiUhRBvXj8RHBZ1oj2fEzIG47AnTpihQugVZcWI15GXj9t2nsppeQdNiKVEphfM
        BlnigpodSf0S4fksONOyyBSv/v4OhGuWqlZ1l9d9n5inCG4q3UVU2Ux5cmBZCCsMCw8KK2+HSSsVh
        v9W8wO4A==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kE6Ql-0007aC-4o; Fri, 04 Sep 2020 07:46:43 +0000
Date:   Fri, 4 Sep 2020 08:46:43 +0100
From:   Christoph Hellwig <hch@infradead.org>
To:     Rishabh Bhatnagar <rishabhb@codeaurora.org>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, sidgup@codeaurora.org
Subject: Re: [PATCH v3 0/3] Expose recovery/coredump configuration from sysfs
Message-ID: <20200904074643.GA26741@infradead.org>
References: <1599174226-2307-1-git-send-email-rishabhb@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1599174226-2307-1-git-send-email-rishabhb@codeaurora.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Sep 03, 2020 at 04:03:42PM -0700, Rishabh Bhatnagar wrote:
> >From Android R onwards Google has restricted access to debugfs in user
> and user-debug builds. This restricts access to most of the features
> exposed through debugfs. This patch series removes the recovery/coredump
> entries from debugfs and adds a configurable option to expose these
> interfaces from sysfs. 

so please fix android instead of messing up the upstream kernel.
