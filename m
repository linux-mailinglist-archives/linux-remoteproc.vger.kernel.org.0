Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE8C26FC17
	for <lists+linux-remoteproc@lfdr.de>; Mon, 22 Jul 2019 11:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728103AbfGVJYd (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 22 Jul 2019 05:24:33 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:56436 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727701AbfGVJYd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 22 Jul 2019 05:24:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=t3OOtdtvnUF+XIhRdblqC3W61fdm4p0+hRCO2GTass0=; b=T5bfwCKQxBqLdvGK7DUUv/qBF
        A3kj9iXi8RBhf93TTorLkVtrw7BW16+3qcT/9BEB2Ga6jU6aEy0WklSkiV9ZxcBQiGgiIrC6CC2K5
        fuVktxlCFh34qfa/DF37DbcFPYJXGrgM+3qTzGn3xiuQ884GfaRbjwSrqBRVHS0R8VgwSpASMod9X
        XjtU86WIBrX8lLXvkgincw5Mh5dEeSvNQE7YvNezTP2r+yRPNY/ybN/Np+9Xhqnh+U6NqbtueEVv0
        5ibmXk+6BFTEQkmKv66nwmKvr6BtbpDn6l0hEKNk1b4LnUXUrAJNZfZMul4QE8bj3Z7XnrsgqaDOo
        xnZXpYI2Q==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat Linux))
        id 1hpUYX-0000m2-Ao; Mon, 22 Jul 2019 09:24:29 +0000
Date:   Mon, 22 Jul 2019 02:24:29 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Loic PALLARDY <loic.pallardy@st.com>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Clement Leger <cleger@kalray.eu>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] remoteproc: copy parent dma_pfn_offset for vdev
Message-ID: <20190722092429.GB12167@infradead.org>
References: <20190612095521.4703-1-cleger@kalray.eu>
 <20190701070245.32083-1-cleger@kalray.eu>
 <20190702132229.GA8100@infradead.org>
 <58c8b8bd30a949678c027eb42a1b1bbb@SFHDAG7NODE2.st.com>
 <20190708184546.GA20670@infradead.org>
 <20190719063250.GA9545@infradead.org>
 <3c2c98e785704969a862715ab52ce2de@SFHDAG7NODE2.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c2c98e785704969a862715ab52ce2de@SFHDAG7NODE2.st.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Jul 22, 2019 at 08:41:32AM +0000, Loic PALLARDY wrote:
> Ongoing...
> Two topics to clean up:
> - Sub device creation and DMA ops inheritance --> need to use platform_device or device tree
> - dma_declare_coherent_memory use --> it has been introduced to support internal memories declared via reg field.
> I propose to migrate existing drivers on reserved memory usage and so remove dma_declare_coherent call from remoteproc core.

I thought this was inter-related in that you needed the additional
field with the manual memory region for the subdevs, but I guess I
misunderstood.  Anyway, thanks for doing the work.
