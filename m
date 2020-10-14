Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65A0A28D74E
	for <lists+linux-remoteproc@lfdr.de>; Wed, 14 Oct 2020 02:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727439AbgJNAKF (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Tue, 13 Oct 2020 20:10:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:47326 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727391AbgJNAKF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 13 Oct 2020 20:10:05 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602634204;
        bh=EO5OU+wThmFrTjZAazcG+vKY3kjz+gaQxwN+Wl19aA8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=h2EFEYH6UDMLHKJ0OSMdS8zmaxfLV83B7/6tCFmEHuX0jIWiCCWjkKscBD90AEHpQ
         ez4of7uWNzJ91o5W3BU6Tm5ZCYza2XPLy/1iQJx/5fzzV5cOV6Re4JhOkcjPY5R9tG
         FFRgklfTBld4OxsqkMJJ4QXnnYnCaXGSDl9nRGZc=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] remoteproc: qcom_q6v5: Assign mpss region to Q6 before MBA
 boot
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <160263420468.29882.14405653114194679526.git-patchwork-notify@kernel.org>
Date:   Wed, 14 Oct 2020 00:10:04 +0000
References: <20200917175840.18708-1-sibis@codeaurora.org>
In-Reply-To: <20200917175840.18708-1-sibis@codeaurora.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Thu, 17 Sep 2020 23:28:40 +0530 you wrote:
> On secure devices which support warm reset, the MBA firmware requires
> access to the modem region to clear them out. Hence provide Q6 access
> to this region before MBA boot. This will be a nop during a modem SSR.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
> 
> [...]

Here is the summary with links:
  - [v3] remoteproc: qcom_q6v5: Assign mpss region to Q6 before MBA boot
    https://git.kernel.org/andersson/remoteproc/c/4360f93ac39c

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


