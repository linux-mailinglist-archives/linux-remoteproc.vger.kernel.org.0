Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A55C19381D
	for <lists+linux-remoteproc@lfdr.de>; Thu, 26 Mar 2020 06:47:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726138AbgCZFrA (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Thu, 26 Mar 2020 01:47:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:44468 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726038AbgCZFrA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 26 Mar 2020 01:47:00 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585201620;
        bh=3s1lGPAo15cFB+NgzYn+r+FT8eGi1nCZh5GKGH6f1kQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=P/84iAoIpbmvw1P8qpCA+B7DjggL6XN8MLym4vX4PwV2BsJD8SUFaGSmWegMzlvSq
         Fzt+N5SLwlNCq9vsSqrBRyMVmPhGQgQo12MZ4PlTLdbY15cVJzCygBi8eAlSppYhfV
         9NTEMAQcNzhMq1smgbe39/mywxLiles9PoudCMX4=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc: error on kick missing
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <158520162008.22016.336406441463178075.git-patchwork-notify@kernel.org>
Date:   Thu, 26 Mar 2020 05:47:00 +0000
References: <20200228110804.25822-1-nikita.shubin@maquefel.me>
In-Reply-To: <20200228110804.25822-1-nikita.shubin@maquefel.me>
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next).

On Fri, 28 Feb 2020 14:08:04 +0300 you wrote:
> From: Nikita Shubin <NShubin@topcon.com>
> 
> .kick method not set in rproc_ops will result in:
> 
> 8<--- cut here ---
> Unable to handle kernel NULL pointer dereference
> 
> [...]


Here is a summary with links:
  - remoteproc: error on kick missing
    https://git.kernel.org/andersson/remoteproc/c/791c13b709dd51eb37330f2a5837434e90c87c27

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
