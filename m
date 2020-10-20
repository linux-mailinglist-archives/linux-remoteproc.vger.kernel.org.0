Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE74028D74C
	for <lists+linux-remoteproc@lfdr.de>; Wed, 14 Oct 2020 02:10:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727472AbgJNAKF (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 13 Oct 2020 20:10:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:47322 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727157AbgJNAKF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 13 Oct 2020 20:10:05 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602634204;
        bh=qQ5EqYwXDde69BczRuhGvYx4bLc26+S6k5mYGLr0U9Y=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=LnmdsU85qIQAaKfJjJd76YUGd5zQwCoe4NhArbF3qbv32ml9ygJX8yHEy3kk8rDMx
         PWafpiouPbelev7rvPdOsR9NACP/It0rv3EEZgQna4D2XC0aGUCJMuvaOGfRJYC/OM
         gIMxt+V/CVGtFlk+f2/Haeya1Zo3A85r0ZU+WrLI=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] remoteproc: Fixup coredump debugfs disable request
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <160263420464.29882.10567903022882016703.git-patchwork-notify@kernel.org>
Date:   Wed, 14 Oct 2020 00:10:04 +0000
References: <20200916145100.15872-1-sibis@codeaurora.org>
In-Reply-To: <20200916145100.15872-1-sibis@codeaurora.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Wed, 16 Sep 2020 20:21:00 +0530 you wrote:
> Fix the discrepancy observed between accepted input and read back value
> while disabling remoteproc coredump through the coredump debugfs entry.
> 
> Fixes: 3afdc59e4390 ("remoteproc: Add coredump debugfs entry")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> 
> [...]

Here is the summary with links:
  - [v2] remoteproc: Fixup coredump debugfs disable request
    https://git.kernel.org/andersson/remoteproc/c/189462263674

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


